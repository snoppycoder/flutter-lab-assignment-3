import 'dart:convert';
import 'package:flutter_project_3/data/models/album.model.dart';
import 'package:http/http.dart' as http;


class AlbumRepository{
  final _base_url = "https://jsonplaceholder.typicode.com"; //retrofit similarity
  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    final albumResponse = await http.get(Uri.parse("${_base_url}/albums"));
    final photoResponse = await http.get(Uri.parse("${_base_url}/photos"));
    if(albumResponse.statusCode == 200 && photoResponse.statusCode == 200){
      final albums = json.decode(albumResponse.body) as List;
      final photos = json.decode(photoResponse.body) as List;
      final albumPhotos = <int, String>{};
      for (var photo in photos) {
        if (!albumPhotos.containsKey(photo['albumId'])) {
          albumPhotos[photo['albumId']] = photo['thumbnailUrl']; //basically saying if the albumID is unique
        }
      }
      return albums.map((album) {
        return {
          'id': album['id'],
          'title': album['title'],
          'thumbnailUrl': albumPhotos[album['id']] ?? ''
        };
      }).toList();
    }
    else {
      throw Exception("Internet problem");
    }
   
      


  }



}