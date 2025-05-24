import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_3/bloc/album.bloc.dart';
import 'package:flutter_project_3/bloc/album.event.dart';
import 'package:flutter_project_3/bloc/album.state.dart';
import 'package:flutter_project_3/presentation/widgets/album.tile.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Albums'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (context, state) {
            if (state is AlbumLoading) {
              return Center(child: CircularProgressIndicator(color: Colors.deepPurple));
            } else if (state is AlbumLoaded) {
              return ListView.separated(
                itemCount: state.albums.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final album = state.albums[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AlbumTile(
                        title: album['title'],
                        thumbnailUrl: album['thumbnailUrl'],
                        onTap: () => context.go('/detail', extra: album),
                      ),
                    ),
                  );
                },
              );
            } else if (state is AlbumError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.red[700], fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        context.read<AlbumBloc>().add(FetchAlbums());
                      },
                      child: Text(
                            'Retry',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
