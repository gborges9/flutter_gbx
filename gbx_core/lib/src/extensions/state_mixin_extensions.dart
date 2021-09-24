import 'package:dartz/dartz.dart';
import 'package:gbx_core/gbx_core.dart';
import 'package:gbx_core/src/interfaces/index.dart';
import 'package:get/get.dart';

extension ContentLoader<T> on StateMixin<T> {
  Future<void> loadContent(Future<Either<IFailure, T>> Function() body,
      {void Function(IFailure failure)? onFailure,
      void Function(T)? onSuccess}) async {
    change(null, status: RxStatus.loading());
    var result = await body();

    if (result.isLeft()) {
      change(null, status: RxStatus.error());
      if (onFailure == null) {
        result.showError();
      } else {
        onFailure.call(result.left);
      }
    } else {
      var r = result.right;
      change(result.right,
          status: (r is List && r.length == 0)
              ? RxStatus.empty()
              : RxStatus.success());
      onSuccess?.call(result.right);
    }
  }
}
