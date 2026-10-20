import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/song.dart';
import '../../domain/usecases/get_songs.dart';

class SongsNotifier extends AsyncNotifier<List<Song>> {
  @override
  Future<List<Song>> build() => _load();

  Future<List<Song>> _load() async {
    final result = await sl<GetSongs>()();
    return switch (result) {
      Success(:final data) => data,
      Err(:final failure) => throw failure,
    };
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }
}

final songsProvider =
    AsyncNotifierProvider<SongsNotifier, List<Song>>(SongsNotifier.new);

final searchQueryProvider = StateProvider<String>((_) => '');

final filteredSongsProvider = Provider<AsyncValue<List<Song>>>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  return ref.watch(songsProvider).whenData((songs) {
    if (query.isEmpty) return songs;
    return songs
        .where((s) =>
            s.title.toLowerCase().contains(query) ||
            s.artist.toLowerCase().contains(query) ||
            s.album.toLowerCase().contains(query))
        .toList();
  });
});
