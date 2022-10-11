// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QueryParams _$$_QueryParamsFromJson(Map<String, dynamic> json) =>
    _$_QueryParams(
      limit: json['limit'] as int? ?? 10,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$_QueryParamsToJson(_$_QueryParams instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
