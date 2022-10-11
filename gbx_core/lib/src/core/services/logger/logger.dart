abstract class ILogger {
  const ILogger();

  void v(dynamic message, {dynamic error, StackTrace? stackTrace, Type? type});

  void d(dynamic message, {dynamic error, StackTrace? stackTrace, Type? type});

  void i(dynamic message, {dynamic error, StackTrace? stackTrace, Type? type});

  void w(dynamic message, {dynamic error, StackTrace? stackTrace, Type? type});

  void e(dynamic message, {dynamic error, StackTrace? stackTrace, Type? type});

  void wtf(dynamic message,
      {dynamic error, StackTrace? stackTrace, Type? type});
}
