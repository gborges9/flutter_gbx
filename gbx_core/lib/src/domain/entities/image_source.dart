import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gbx_core/src/domain/entities/image_source_type.dart';

part 'image_source.freezed.dart';
part 'image_source.g.dart';

@freezed
class ImageSource with _$ImageSource {
  const ImageSource._();

  @ImageSourceConverter()
  const factory ImageSource.asset(String path) = AssetImageSource;
  @ImageSourceConverter()
  const factory ImageSource.network(String url) = NetworkImageSource;

  ImageProvider asProvider() {
    return when(
        asset: (path) => AssetImage(path), network: (url) => NetworkImage(url));
  }

  String get urlOrPath => when(
        asset: (path) => path,
        network: (url) => url,
      );

  factory ImageSource.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceFromJson(json);
}

class ImageSourceConverter
    implements JsonConverter<ImageSource, Map<String, dynamic>> {
  const ImageSourceConverter();

  @override
  ImageSource fromJson(Map<String, dynamic> json) {
    const values = ImageSourceType.values;
    final names = values.map((e) => e.name).toList();
    final typeName = json['type'] as String;

    final index = names.indexOf(typeName);
    final type = index >= 0 ? values[index] : null;

    switch (type) {
      case ImageSourceType.asset:
        return AssetImageSource(json['url']);
      case ImageSourceType.network:
        return NetworkImageSource(json['url']);

      default:
        throw FallThroughError();
    }
  }

  @override
  Map<String, dynamic> toJson(ImageSource object) => object.map(
        asset: (path) => {'type': ImageSourceType.asset.name, 'url': path},
        network: (url) => {'type': ImageSourceType.network.name, 'url': url},
      );
}
