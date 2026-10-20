abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);
  @override
  String toString() => message;
}

class PermissionFailure extends Failure {
  const PermissionFailure() : super('Storage/audio permission was denied.');
}

class LibraryFailure extends Failure {
  const LibraryFailure([super.message = 'Failed to read the music library.']);
}
