import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'logger.dart';

class TalkerLoggerImpl extends ILogger {
  late final Talker _talker;
  
   Talker get talker => _talker;

  TalkerLoggerImpl([List<TalkerObserver> observers = const []]) {
    _talker = Talker(
      loggerOutput: debugPrint,
      observers: observers,
    );
  }

  @override
  void d(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.debug(_typedMessage(message, type), error, stackTrace);
  }

  @override
  void e(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.error(_typedMessage(message, type), error, stackTrace);
  }

  @override
  void i(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.info(_typedMessage(message, type), error, stackTrace);
  }

  @override
  void v(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.verbose(_typedMessage(message, type), error, stackTrace);
  }

  @override
  void w(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.warning(_typedMessage(message, type), error, stackTrace);
  }

  @override
  void wtf(message, {error, StackTrace? stackTrace, Type? type}) {
    _talker.critical(_typedMessage(message, type), error, stackTrace);
  }

  String? _typedMessage(message, Type? type) {
    String msg = "$message";
    if (type != null) {
      msg = "[$type] $msg";
    }
    return msg;
  }
}
