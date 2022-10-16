// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImageSource _$$AssetImageSourceFromJson(Map<String, dynamic> json) =>
    _$AssetImageSource(
      json['path'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssetImageSourceToJson(_$AssetImageSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'runtimeType': instance.$type,
    };

_$NetworkImageSource _$$NetworkImageSourceFromJson(Map<String, dynamic> json) =>
    _$NetworkImageSource(
      json['url'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NetworkImageSourceToJson(
        _$NetworkImageSource instance) =>
    <String, dynamic>{
      'url': instance.url,
      'runtimeType': instance.$type,
    };
