import 'package:flutter/material.dart';
import 'package:flutter_project_3/presentation/screens/album.detail.screen.dart';
import 'package:flutter_project_3/presentation/screens/album.list.screen.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AlbumListScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final album = state.extra as Map<String, dynamic>;
        return AlbumDetailScreen(album: album);
      },
    ),
  ],
);
