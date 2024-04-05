import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';

import '../../core/errors/server_failure.dart';

class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call()async{
    return repository.getTrendingMovies();
  }
}