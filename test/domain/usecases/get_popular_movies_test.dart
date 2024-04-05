

import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';
import 'package:first_flutter_project/domain/usecases/get_popular_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_popular_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late GetPopularMovies   useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository=MockMovieRepository();
    useCase=GetPopularMovies(mockMovieRepository);
  });

  final pMoviesList=[
    Movie(id:1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    Movie(id: 2, title: "Test Movie 2", overview: "Description 2", posterPath: "/image2"),
  ];

  test('should popular trending movies from repository', ()  async{

    // //arrange
    // when(mockMovieRepository.getPopularMovies()).thenAnswer((_) async => pMoviesList);

    // arrange
    when(mockMovieRepository.getPopularMovies())
        .thenAnswer((_) async => Right(pMoviesList));
    //act
    final result=await useCase();

    //assert
    expect(result, pMoviesList);
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);


  });
}