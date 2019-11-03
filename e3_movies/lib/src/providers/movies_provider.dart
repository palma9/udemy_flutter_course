import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:e3_movies/src/models/actor_model.dart';
import 'package:e3_movies/src/models/movie_model.dart';


class MoviesProvider {
  String _apikey    = 'fcd942bcb37be15c703accfc8a98ec9c';
  String _url       = 'api.themoviedb.org';
  String _languaje  = 'es-ES';
  int _popularsPage = 0;
  bool _loading     = false;

  List<Movie> _populars = List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  Future<List<Movie>> getNowPlaying() {  
    final url = Uri.https(_url, '/3/movie/now_playing', {
      'api_key' : _apikey,
      'language': _languaje
    });
    
    return _getbyUrl(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];

    _loading = true;
    
    _popularsPage++;
    final url = Uri.https(_url, '/3/movie/popular', {
      'api_key' : _apikey,
      'language': _languaje,
      'page'    : _popularsPage.toString()
    });

    final resp = await _getbyUrl(url);

    _populars.addAll(resp);
    popularsSink(_populars);

    _loading = false;
    return resp;
  }

  Future<List<Movie>> _getbyUrl(Uri url) async {
    final res = await http.get(url);
    final decodedData = json.decode(res.body);
    final movies = Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

  Future<List<Actor>> getMovieCast(String movieId) async {
    final url = Uri.https(_url, '/3/movie/$movieId/credits', {
      'api_key' : _apikey,
      'language': _languaje
    });

    final res = await http.get(url);
    final decodedData = json.decode(res.body);
    final cast = Cast.fromJsonList(decodedData['cast']);

    return cast.actors;
  } 

  void disposeStreams() => _popularsStreamController?.close();

}