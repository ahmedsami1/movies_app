import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie_model.dart';

class Api {
  String trendingUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=be207233ce332a3fcd4833ed81f4a60f';
  String topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=be207233ce332a3fcd4833ed81f4a60f';
  String upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?language=en-US&api_key=be207233ce332a3fcd4833ed81f4a60f';

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie)=>MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something Happened');
    }
    }

  Future<List<MovieModel>> getRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie)=>MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something Happened');
    }
    }
  Future<List<MovieModel>> upcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie)=>MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something Happened');
    }
    }
}
