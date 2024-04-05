import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';
import 'package:first_flutter_project/domain/usecases/get_trending_movies.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late GetTrendingMovies   useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository=MockMovieRepository();
    useCase=GetTrendingMovies(mockMovieRepository);
  });

  final tMoviesList=[
    Movie(id: 1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    Movie(id: 2, title: "Test Movie 2",overview:  "Description 2", posterPath: "/image2"),
  ];

  test('should get trending movies from repository', ()  async{

    //arrange
    when(mockMovieRepository.getTrendingMovies()).thenAnswer((_) async => Right(tMoviesList));

    //act
    final result=await useCase();

    //assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);


  });

}