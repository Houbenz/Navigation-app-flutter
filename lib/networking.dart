import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> deleteAlbum(String id ) async {
  final http.Response response = await http.delete('https://jsonplaceholder.typicode.com/albums/$id',
  headers: {
    'Content-Type': 'application/json;charset=UTF-8',
  });

  if(response.statusCode == 200){
    return Album.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to delete Album');
  }
}

Future<Album> fetchAlbum() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/2');
  if(response.statusCode == 200){

      return Album.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Failed to load Album");
  }

}

class Album{
  final int userId;
  final int id;
  final String title;
  Album({this.userId,this.id,this.title});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      userId : json['userId'],
        id : json['id'],
        title : json['title'],
    );
  }
}