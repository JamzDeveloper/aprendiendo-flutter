import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  final String _apiKey = 'ed9029ed89725b40d35194fa79616a38';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  int _popularesPage = 0;
  bool _loader = false;
  List<Pelicula> _peliculasRecientes = [];
  //stream

  List<Pelicula> _populares = [];

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStream() {
    _popularesStreamController.close();
  }

  Future<List<Pelicula>> _procesResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCine() async {
    final url = Uri.https(_url, "3/movie/now_playing",
        {'api_key': _apiKey, 'language': _language});

    return await _procesResponse(url);
  }

  Future<List<Pelicula>> getPopulars() async {
    if (_loader) return [];

    _loader = true;
    _popularesPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesResponse(url);

    _populares.addAll(resp);

    popularesSink(_populares);

    _loader = false;
    return resp;
    //return await _procesResponse(url);
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, "3/search/movie",
        {'api_key': _apiKey, 'language': _language, 'query': query});

    return await _procesResponse(url);
  }

  setPeliculaReciente(Pelicula pelicula) {
    _peliculasRecientes
        .removeWhere((element) => element.title == pelicula.title);
    _peliculasRecientes.add(pelicula);
  }

  List<Pelicula> peliculasRecientes() {
    return _peliculasRecientes.reversed.toList();
  }
}
