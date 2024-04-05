import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';

import '../../core/errors/server_failure.dart';

class GetPopularMovies{
  final MovieRepository movieRepository;

  GetPopularMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async{
    return await movieRepository.getPopularMovies();
  }
}