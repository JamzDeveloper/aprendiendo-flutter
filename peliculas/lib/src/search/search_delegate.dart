import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  // String seleccion = '';
  final peliculaProvider = PeliculaProvider();
//  final peliculas = ['Spiderman', 'Aquaman', 'Batman', 'Shazam', 'Iroman'];
  // final peliculasRecientes = ['Spiderman', 'batman'];
  //List<Pelicula> peliculasRecientes = [];

  //List<Pelicula> resultado = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // acciondes de nuestro appbar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          //   resultado = [];
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // icono a la izquierda dela appbar

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // creaa los resultados a mostrar

    // return ListView(
    //   children: resultado.map((pelicula) {
    //     return ListTile(
    //       leading: FadeInImage(
    //         image: NetworkImage(pelicula.getPosterImage()),
    //         placeholder: AssetImage('assets/img/no-image.jpg'),
    //         width: 50.0,
    //         fit: BoxFit.contain,
    //       ),
    //       title: Text(pelicula.title.toString()),
    //       subtitle: Text(pelicula.originalTitle.toString()),
    //       onTap: () {
    //         pelicula.uniqueId = '';
    //         peliculaProvider.setPeliculaReciente(pelicula);
    //         Navigator.pushNamed(context, '/detalle', arguments: pelicula);
    //       },
    //     );
    //   }).toList(),
    // );
    if (query.isEmpty) {
       return _showPeliculasRecientes(context);
    } else {
      return FutureBuilder(
        future: peliculaProvider.buscarPelicula(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;

            return ListView(
              children: peliculas!.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImage()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title.toString()),
                  subtitle: Text(pelicula.originalTitle.toString()),
                  onTap: () {
                    //close(context, null);
                    //       peliculasRecientes.add('de1111');
                    //  peliculasRecientes.add(pelicula.title.toString());
                    peliculaProvider.setPeliculaReciente(pelicula);
                    // peliculasRecientes.add(pelicula);

                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, '/detalle',
                        arguments: pelicula);
                  },
                );
              }).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias cuando la persona escribe
    if (query.isEmpty) {
      // return ListView(
      //   children: peliculasRecientes.map((pelicula) {
      //     return ListTile(
      //       leading: FadeInImage(
      //         image: NetworkImage(pelicula.getPosterImage()),
      //         placeholder: AssetImage('assets/img/no-image.jpg'),
      //         width: 50.0,
      //         fit: BoxFit.contain,
      //       ),
      //       title: Text(pelicula.title.toString()),
      //       subtitle: Text(pelicula.originalTitle.toString()),
      //       onTap: () {
      //         pelicula.uniqueId = '';
      //         peliculasRecientes.add(pelicula);
      //         Navigator.pushNamed(context, '/detalle', arguments: pelicula);
      //       },
      //     );
      //   }).toList(),
      // );
      return _showPeliculasRecientes(context);
    } else {
//    peliculaProvider.buscarPelicula(query).then((List<Pelicula> peliculas) {
//      resultado = peliculas;
//    });
//
      return FutureBuilder(
        future: peliculaProvider.buscarPelicula(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;

            return ListView(
              children: peliculas!.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImage()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title.toString()),
                  subtitle: Text(pelicula.originalTitle.toString()),
                  onTap: () {
                    //close(context, null);
                    //       peliculasRecientes.add('de1111');
                    //  peliculasRecientes.add(pelicula.title.toString());
                    peliculaProvider.setPeliculaReciente(pelicula);
                    // peliculasRecientes.add(pelicula);

                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, '/detalle',
                        arguments: pelicula);
                  },
                );
              }).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  Widget _showPeliculasRecientes(BuildContext context) {
    return ListView(
      children: peliculaProvider.peliculasRecientes().map((pelicula) {
        return ListTile(
          leading: FadeInImage(
            image: NetworkImage(pelicula.getPosterImage()),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            width: 50.0,
            fit: BoxFit.contain,
          ),
          title: Text(pelicula.title.toString()),
          subtitle: Text(pelicula.originalTitle.toString()),
          onTap: () {
            pelicula.uniqueId = '';
            peliculaProvider.setPeliculaReciente(pelicula);
            Navigator.pushNamed(context, '/detalle', arguments: pelicula);
          },
        );
      }).toList(),
    );
  }
}
