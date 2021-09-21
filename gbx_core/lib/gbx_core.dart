library gbx_core;

import 'package:gbx_core/src/interfaces/gbx_interface.dart';

export 'package:get/get.dart';
export 'package:dartz/dartz.dart';
export 'package:equatable/equatable.dart';

export 'package:gbx_core/src/extensions/index.dart';
export 'package:gbx_core/src/interfaces/index.dart';
export 'package:gbx_core/src/modules/index.dart';
export 'package:gbx_core/src/utils/index.dart';

class _GbxImpl extends GbxInterface {}

final Gbx = _GbxImpl();
