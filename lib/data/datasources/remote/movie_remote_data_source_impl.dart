

import 'dart:convert';

import 'package:first_flutter_project/core/errors/server_exception.dart';
import 'package:first_flutter_project/main.dart';
import 'package:http/http.dart' as http;

import 'package:first_flutter_project/data/models/MovieModel.dart';

import '../movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const baseUrl='http://api.themoviedb.org/3';
  static const apiKey='f98a79b07c64189444630cf2894e5d92';

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response=await client.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
    logger.d("Popular :${response.body}");
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final List<MovieModel> movies=(responseBody['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
      return movies;
    }else{
      throw ServerException();
    }

  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async{
    final response=await client.get(Uri.parse("$baseUrl/trending/movie/day?api_key=$apiKey"));
    logger.d("trending :${response.body}");
    if(response.statusCode==200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }else{
      logger.d("error :$response");
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async{
    final response=await client.get(Uri.parse("$baseUrl/search/movie?query=$query&api_key=$apiKey"));
    logger.d("search :${response.body}");
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final List<MovieModel> movies=(responseBody['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
      return movies;
    }else{
      throw ServerException();
    }
  }
}