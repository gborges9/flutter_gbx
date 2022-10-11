// import 'package:logger/logger.dart';

// class Log {
//   static final Logger _logger = Logger(
//     level: Level.verbose,
//     printer: _CustomPrinter(),
//   );

//   static void v(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.v(_taggedMessage(message, type), error, stackTrace);

//   static void d(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.d(_taggedMessage(message, type), error, stackTrace);

//   static void i(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.i(_taggedMessage(message, type), error, stackTrace);

//   static void w(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.w(_taggedMessage(message, type), error, stackTrace);

//   static void e(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.e(_taggedMessage(message, type), error, stackTrace);

//   static void wtf(dynamic message,
//           {dynamic error, StackTrace? stackTrace, Type? type}) =>
//       _logger.wtf(_taggedMessage(message, type), error, stackTrace);

//   static String _taggedMessage(dynamic message, Type? type) =>
//       type == null ? message.toString() : "[${type.toString()}] $message";
// }

// class _CustomPrinter extends PrettyPrinter {
//   static final _deviceStackTraceRegex =
//       RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');
//   static final _webStackTraceRegex =
//       RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');
//   static final _browserStackTraceRegex =
//       RegExp(r'^(?:package:)?(dart:[^\s]+|[^\s]+)');

//   _CustomPrinter({int stackTraceBeginIndex = 0})
//       : super(stackTraceBeginIndex: stackTraceBeginIndex);

//   @override
//   String? formatStackTrace(StackTrace? stackTrace, int methodCount) {
//     var lines = stackTrace.toString().split('\n');
//     if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
//       lines = lines.sublist(stackTraceBeginIndex);
//     }
//     var formatted = <String>[];
//     var count = 0;
//     for (var line in lines) {
//       if (_discardDeviceStacktraceLine(line) ||
//           _discardWebStacktraceLine(line) ||
//           _discardBrowserStacktraceLine(line) ||
//           line.contains("utils/logger.dart") ||
//           line.isEmpty) {
//         continue;
//       }
//       formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
//       if (++count == methodCount) {
//         break;
//       }
//     }

//     if (formatted.isEmpty) {
//       return null;
//     } else {
//       return formatted.join('\n');
//     }
//   }

//   bool _discardDeviceStacktraceLine(String line) {
//     var match = _deviceStackTraceRegex.matchAsPrefix(line);
//     if (match == null) {
//       return false;
//     }
//     return match.group(2)!.startsWith('package:logger');
//   }

//   bool _discardWebStacktraceLine(String line) {
//     var match = _webStackTraceRegex.matchAsPrefix(line);
//     if (match == null) {
//       return false;
//     }
//     return match.group(1)!.startsWith('packages/logger') ||
//         match.group(1)!.startsWith('dart-sdk/lib');
//   }

//   bool _discardBrowserStacktraceLine(String line) {
//     var match = _browserStackTraceRegex.matchAsPrefix(line);
//     if (match == null) {
//       return false;
//     }
//     return match.group(1)!.startsWith('package:logger') ||
//         match.group(1)!.startsWith('dart:');
//   }
// }
