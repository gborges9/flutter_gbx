import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'logger.dart';

class TalkerLoggerImpl extends ILogger {
  late final Talker _talker;

  TalkerLoggerImpl([List<TalkerObserver> observers = const []]) {
    _talker = Talker(
      loggerOutput: debugPrint,
      observers: observers,
    );
  }

  @override
  void d(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.debug(message, error, stackTrace);
  }

  @override
  void e(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.error(message, error, stackTrace);
  }

  @override
  void i(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.info(message, error, stackTrace);
  }

  @override
  void v(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.verbose(message, error, stackTrace);
  }

  @override
  void w(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.warning(message, error, stackTrace);
  }

  @override
  void wtf(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.critical(message, error, stackTrace);
  }
}
