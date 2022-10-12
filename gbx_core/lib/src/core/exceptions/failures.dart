class Failure {
  final String? message;
  final dynamic error;
  final StackTrace? trace;
  final Type origin;

  const Failure({this.message, this.error, this.trace, required this.origin});
}
