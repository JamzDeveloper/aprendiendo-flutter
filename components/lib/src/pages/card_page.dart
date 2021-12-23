import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('card page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.5),
        children: <Widget>[
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
          const SizedBox(height: 30.0),
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      //clipBehavior:Clip.antiAlias,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(children: <Widget>[
        const ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Mitos de la programacion'),
          subtitle: Text(
              'la programacion no paga mucho, si bien es cierto hay muha demanda laboral pero tambien hay muchos programadores, lo que ocaciona a que el precio sea relativo dependiendo de la experiencia de cada programador '),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(child: const Text('Cancelar'), onPressed: () => {}),
            TextButton(child: const Text('Ok'), onPressed: () => {})
          ],
        )
      ]),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: const NetworkImage(
                'https://www.radioacktiva.com/wp-content/uploads/2021/12/1_9ifaqtz.jpg'),
            height: 200.0,
            fadeInDuration: const Duration(milliseconds: 200),
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/he_vuelto_a_caer.jpg',
                  fit: BoxFit.cover);
            },
          ),
          // const Image(
          //   image: NetworkImage(
          //       'https://www.radioacktiva.com/wp-content/uploads/2021/12/1_9ifaqtz.jpg'),
          // ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
                'La mejor pelicula donde reunen a los tres Spider-man'),
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            const BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0), child: card),
    );
  }
}
