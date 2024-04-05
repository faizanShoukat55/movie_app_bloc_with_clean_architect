import 'package:first_flutter_project/data/models/MovieModel.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>>  getTrendingMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> getPopularMovies();
}