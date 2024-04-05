import '../../core/errors/server_failure.dart';
import '../../domain/entities/Movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../main.dart';
import '../datasources/movie_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../models/MovieModel.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure,List<Movie>>> getPopularMovies() async {
    try {

      final List<MovieModel> movieModels = await remoteDataSource.getPopularMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }



  @override
  Future<Either<ServerFailure,List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels = await remoteDataSource.getTrendingMovies();
      logger.e("impl trending models :${movieModels.length}  ${movieModels.first.toString()}");
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      logger.e("impl trending :${movies.length}");
      return Right(movies);
    } catch (e) {
      logger.e("impl exception :$e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure,List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels = await remoteDataSource.searchMovies(query);
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

}