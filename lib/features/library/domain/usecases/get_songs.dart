import '../../../../core/utils/result.dart';
import '../entities/song.dart';
import '../repositories/library_repository.dart';

class GetSongs {
  final LibraryRepository _repository;
  const GetSongs(this._repository);

  Future<Result<List<Song>>> call() => _repository.getSongs();
}
