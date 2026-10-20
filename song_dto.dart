import 'package:on_audio_query/on_audio_query.dart';

import '../../domain/entities/song.dart';

class SongDto {
  static Song toEntity(SongModel m) => Song(
        id: m.id,
        title: m.title,
        artist: (m.artist == null || m.artist == '<unknown>')
            ? 'Unknown artist'
            : m.artist!,
        album: m.album ?? 'Unknown album',
        uri: m.uri ?? m.data,
        duration: Duration(milliseconds: m.duration ?? 0),
      );
}
