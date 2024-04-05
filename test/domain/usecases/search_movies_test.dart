import 'package:dartz/dartz.dart';
import 'package:first_flutter_project/domain/entities/Movie.dart';
import 'package:first_flutter_project/domain/repositories/movie_repository.dart';
import 'package:first_flutter_project/domain/usecases/get_trending_movies.dart';
import 'package:first_flutter_project/domain/usecases/search_movies.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late SearchMovies useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository=MockMovieRepository();
    useCase=SearchMovies(mockMovieRepository);
  });

  const sQuery='Inception';

  final sMoviesList=[
    Movie(id: 1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    Movie(id: 2, title: "Test Movie 2", overview: "Description 2", posterPath: "/image2"),
  ];

  test('should get movies from repository using query', ()  async{

    //arrange
    when(mockMovieRepository.searchMovies(any)).thenAnswer((_) async => Right(sMoviesList));

    //act
    final result=await useCase(sQuery);

    //assert
    expect(result, sMoviesList);
    verify(mockMovieRepository.searchMovies(sQuery));
    verifyNoMoreInteractions(mockMovieRepository);


  });

}