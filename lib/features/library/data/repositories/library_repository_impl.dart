import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/song.dart';
import '../../domain/repositories/library_repository.dart';
import '../datasources/local_library_datasource.dart';
import '../models/song_dto.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LocalLibraryDataSource _dataSource;
  const LibraryRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Song>>> getSongs() async {
    try {
      if (!await _dataSource.requestPermission()) {
        return const Err(PermissionFailure());
      }
      final models = await _dataSource.querySongs();
      final songs = models
          .where((m) => (m.duration ?? 0) > 30000) // skip ringtones/notifications
          .map(SongDto.toEntity)
          .toList();
      return Success(songs);
    } catch (e) {
      return Err(LibraryFailure(e.toString()));
    }
  }
}
