class ServerException implements Exception {
  final String errorMessage;

  const ServerException({required this.errorMessage});
}

class CacheException implements Exception {
  final String errorMessage;

  const CacheException({required this.errorMessage});
}
