import '../../../../core/utils/result.dart';
import '../entities/song.dart';

abstract class LibraryRepository {
  Future<Result<List<Song>>> getSongs();
}
