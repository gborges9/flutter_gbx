import 'package:dartz/dartz.dart';

import '../../core/exceptions/failures.dart';

typedef Result<T> = Either<Failure, T>;
typedef ResultSuccess<T> = Right<Failure, T>;
typedef ResultError<T> = Left<Failure, T>;
