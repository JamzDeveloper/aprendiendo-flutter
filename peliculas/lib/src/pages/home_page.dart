import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  PeliculaProvider peliculaProvider = PeliculaProvider();
  Widget build(BuildContext context) {
    //cargamos por primera vez los datos
    peliculaProvider.getPopulars();
    return Scaffold(
        appBar: AppBar(
          title: const Text("peliculas en cine"),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                  
                );
              },
            )
          ],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _swiperCards(),
                _footer(context),
              ]),
        ));
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: peliculaProvider.getEnCine(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return const SizedBox(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
    //  peliculaProvider.getEnCine();
//
    //  return CardSwiper(peliculas: [1, 2, 3, 4, 5]);
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text("Populares", style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 35.0),
          // FutureBuilder(
          //     future: peliculaProvider.getPopulars(),

          StreamBuilder(
              stream: peliculaProvider.popularesStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Pelicula>> snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(
                      peliculas: snapshot.data,
                      nextPage: peliculaProvider.getPopulars);

                  //      return CardSwiper(peliculas: snapshot.data);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
