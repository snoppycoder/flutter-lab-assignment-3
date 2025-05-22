import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Map<String, dynamic> album;

  const AlbumDetailScreen({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Detail')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(album['thumbnailUrl']),
            SizedBox(height: 20),
            Text('Album ID: ${album['id']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Title: ${album['title']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
