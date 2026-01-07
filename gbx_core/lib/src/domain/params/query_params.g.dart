// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryParamsImpl _$$QueryParamsImplFromJson(Map<String, dynamic> json) =>
    _$QueryParamsImpl(
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$QueryParamsImplToJson(_$QueryParamsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
