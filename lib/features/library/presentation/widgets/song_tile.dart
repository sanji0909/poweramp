import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../domain/entities/song.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final VoidCallback? onTap;
  const SongTile({super.key, required this.song, this.onTap});

  String _fmt(Duration d) {
    final m = d.inMinutes;
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: QueryArtworkWidget(
        id: song.id,
        type: ArtworkType.AUDIO,
        artworkBorder: BorderRadius.circular(8),
        nullArtworkWidget: const Icon(Icons.music_note, size: 36),
      ),
      title: Text(song.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('${song.artist} · ${song.album}',
          maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(_fmt(song.duration)),
    );
  }
}
