import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class peliculaDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pelicula = ModalRoute.of(context)!.settings.arguments as Pelicula;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10.0),
              _posterTitle(pelicula, context),
              _description(pelicula),
             // _description(pelicula),
             // _description(pelicula),
             // _description(pelicula),
             // _description(pelicula),
              _createCasting(pelicula),
            ]),
          )
        ],
      ),
    );
  }

  Widget _createAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title.toString(),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImage()),
          placeholder: const AssetImage('assets/img/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 10),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/img/no-image.jpg', fit: BoxFit.cover);
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle(Pelicula pelicula, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: NetworkImage(pelicula.getPosterImage()),
                    height: 150.0,
                  ))),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula.title.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(pelicula.originalTitle.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.star_border),
                    Text(
                      pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Text(
        pelicula.overview.toString(),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _createCasting(Pelicula pelicula) {
    final peliProvider = PeliculaProvider();

    return FutureBuilder(
        future: peliProvider.getCast(pelicula.id.toString()),
        builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
          if (snapshot.hasData) {
            return _createActoresPageView(snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _createActoresPageView(List<Actor>? data) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.3, initialPage: 1),
          itemCount: data?.length,
          itemBuilder: (context, i) {
            return _cardActor(data![i]);
          }),
    );
  }

  Widget _cardActor(Actor actor) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(actor.getFoto()),
                height: 150.0,
                fit: BoxFit.cover,
              )),
          Text(
            actor.name.toString(),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
