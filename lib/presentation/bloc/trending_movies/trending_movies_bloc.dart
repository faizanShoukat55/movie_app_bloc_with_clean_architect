
import 'package:first_flutter_project/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:first_flutter_project/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_trending_movies.dart';
import '../../../main.dart';


class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState>{
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies}) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      logger.e("bloc:${failureOrMovies.toString()}");
      failureOrMovies.fold(
              (failure) => emit(TrendingMoviesError(failure.toString())),
              (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}