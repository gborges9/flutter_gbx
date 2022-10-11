import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_params.freezed.dart';
part 'query_params.g.dart';

@freezed
class QueryParams with _$QueryParams {
  const factory QueryParams({@Default(10) int limit, @Default(0) int offset}) =
      _QueryParams;

  factory QueryParams.fromJson(Map<String, dynamic> json) =>
      _$QueryParamsFromJson(json);
}
