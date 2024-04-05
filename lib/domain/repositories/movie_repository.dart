import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';

import '../../core/errors/server_failure.dart';

abstract class MovieRepository{
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> getPopularMovies();
}