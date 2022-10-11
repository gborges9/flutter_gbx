import 'package:gbx_core/src/core/services/logger/logger.dart';
import 'package:gbx_core/src/core/services/logger/talker_logger.dart';

export 'logger.dart';
export 'talker_logger.dart';

final ILogger Log = TalkerLoggerImpl();
