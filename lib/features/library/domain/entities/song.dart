import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String uri;
  final Duration duration;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.uri,
    required this.duration,
  });

  @override
  List<Object?> get props => [id, uri];
}
