import 'package:equatable/equatable.dart';

import '../../domain/entities/Movie.dart';

// class MovieModel extends Equatable{
//   final int? id;
//   final String? title;
//   final String? overview;
//   final String? posterPath;
//
//   const MovieModel({this.id, this.title, this.overview, this.posterPath});
//
//
//   factory MovieModel.fromJson(Map<String,dynamic> json){
//     return MovieModel(id:json['id'], title:json['title'], overview:json['overview'], posterPath:json['posterPath']);
//   }
//
//   Map<String,dynamic> toJson(){
//     return {
//       'id' :id,
//       'title':title,
//       'overview':overview,
//       'posterPath':posterPath
//     };
//   }
//   // Convert Movie toEntity
//   Movie toEntity(){
//     return Movie(
//       id:id??0,
//         title:title??"",
//          overview:overview??"",
//         posterPath:posterPath??""
//     );
//   }
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id,title,overview,posterPath];
//
//
// }

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath
  });

  // Convert JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path']
    );
  }

  // Convert MovieModel into JSON
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  // Convert Movie toEntity
  Movie toEntity(){
    return Movie(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath
    );
  }


}