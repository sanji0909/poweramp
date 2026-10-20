import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../features/library/data/datasources/local_library_datasource.dart';
import '../../features/library/data/repositories/library_repository_impl.dart';
import '../../features/library/domain/repositories/library_repository.dart';
import '../../features/library/domain/usecases/get_songs.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl
    ..registerLazySingleton<OnAudioQuery>(OnAudioQuery.new)
    ..registerLazySingleton<LocalLibraryDataSource>(
        () => LocalLibraryDataSourceImpl(sl()))
    ..registerLazySingleton<LibraryRepository>(
        () => LibraryRepositoryImpl(sl()))
    ..registerLazySingleton<GetSongs>(() => GetSongs(sl()));
}
