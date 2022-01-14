import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula>? peliculas;
  final Function? nextPage;

  MovieHorizontal({@required this.peliculas, @required this.nextPage});

  final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screnSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage!();
      }
    });

    return Container(
        height: _screnSize.height * 0.2,
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas!.length,
          itemBuilder: (context, index) {
            return _card(context, peliculas![index]);
          },

          //children: _cards(context)),
        ));
  }

  Widget _card(BuildContext context, Pelicula pelicula) {

   pelicula.uniqueId = '${pelicula.id}-poster';

    final card = Container(
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(pelicula.getPosterImage()),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/img/no-image.jpg',
                          fit: BoxFit.cover);
                    },
                    fit: BoxFit.cover,
                    height: 140.0,
                  ))),
          Text(
            '${pelicula.title}',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, '/detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _cards(BuildContext context) {
    return peliculas!.map((pelicula) {
      return Container(
        margin: const EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(pelicula.getPosterImage()),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/img/no-image.jpg',
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                  height: 140.0,
                )),
            Text(
              '${pelicula.title}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
