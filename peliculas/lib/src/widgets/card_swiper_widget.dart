import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula>? peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          peliculas![index].uniqueId = '${peliculas![index].id}-card';

          final cardSwiper = Hero(
              tag: peliculas![index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  image: NetworkImage(peliculas![index].getPosterImage()),
                  fit: BoxFit.cover,
                  placeholder: const AssetImage(
                    'assets/img/no-image.jpg',
                  ),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/img/no-image.jpg',
                        fit: BoxFit.cover);
                  },
                ),
              ));
          return GestureDetector(
            child: cardSwiper,
            onTap: () {
              Navigator.pushNamed(context, '/detalle',
                  arguments: peliculas![index]);
            },
          );
        },
        itemCount: peliculas!.length,
      ),
    );
  }
}
