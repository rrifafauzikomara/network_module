import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:network/model/movie.dart';

class ApiProvider {
  Client client = Client();

  //TODO: Add your api key here
  static final _apiKey = '24d18ef569e3997bf2779d05440d3c6e';
  static final String _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<Movie> getMovieList() async {
    final url = Uri.parse("$_baseUrl/popular?api_key=$_apiKey");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}