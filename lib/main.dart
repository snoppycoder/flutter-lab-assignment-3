import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_3/bloc/album.bloc.dart';
import 'package:flutter_project_3/bloc/album.event.dart';
import 'package:flutter_project_3/data/repository/album.repository.dart';
import 'package:flutter_project_3/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AlbumRepository repository = AlbumRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(repository)..add(FetchAlbums()),
      child: MaterialApp.router(
        title: 'Album App',
        routerConfig: router,
      ),
    );
  }
}
