// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImageSourceImpl _$$AssetImageSourceImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetImageSourceImpl(
      json['path'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssetImageSourceImplToJson(
        _$AssetImageSourceImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'runtimeType': instance.$type,
    };

_$NetworkImageSourceImpl _$$NetworkImageSourceImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkImageSourceImpl(
      json['url'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NetworkImageSourceImplToJson(
        _$NetworkImageSourceImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'runtimeType': instance.$type,
    };
