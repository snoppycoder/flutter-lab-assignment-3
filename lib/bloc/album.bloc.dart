import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_3/bloc/album.event.dart';
import 'package:flutter_project_3/bloc/album.state.dart';
import 'package:flutter_project_3/data/repository/album.repository.dart';


class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}
