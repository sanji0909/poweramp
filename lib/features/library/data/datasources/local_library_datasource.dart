import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocalLibraryDataSource {
  Future<bool> requestPermission();
  Future<List<SongModel>> querySongs();
}

class LocalLibraryDataSourceImpl implements LocalLibraryDataSource {
  final OnAudioQuery _query;
  const LocalLibraryDataSourceImpl(this._query);

  @override
  Future<bool> requestPermission() async {
    // Android 13+ uses READ_MEDIA_AUDIO; older versions use storage.
    if ((await Permission.audio.request()).isGranted) return true;
    return (await Permission.storage.request()).isGranted;
  }

  @override
  Future<List<SongModel>> querySongs() => _query.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
}
