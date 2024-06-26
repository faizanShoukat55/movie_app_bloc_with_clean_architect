import 'package:first_flutter_project/presentation/bloc/popular_movies/poplular_movies_state.dart';
import 'package:first_flutter_project/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_popular_movies.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState>{
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies}) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
              (failure) => emit(PopularMoviesError(failure.toString())),
              (movies) => emit(PopularMoviesLoaded(movies)));
    });
  }
}