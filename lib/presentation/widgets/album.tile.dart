import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final VoidCallback onTap;

  AlbumTile({required this.title, required this.thumbnailUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(thumbnailUrl, width: 50, height: 50),
      title: Text(title),
      onTap: onTap,
    );
  }
}
