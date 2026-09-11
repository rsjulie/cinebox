// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataException implements Exception {
  final String message;
  DataException({
    required this.message,
  });

  @override
  String toString() {
    return 'DataException: $message';
  }
}
