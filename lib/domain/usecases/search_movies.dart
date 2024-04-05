import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';

import '../../core/errors/server_failure.dart';

class SearchMovies{
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query)async{
    return await repository.searchMovies(query);
  }
}