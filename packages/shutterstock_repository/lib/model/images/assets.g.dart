// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assets _$AssetsFromJson(Map<String, dynamic> json) {
  return Assets(
    preview: json['preview'] == null ? null : Preview.fromJson(json['preview']),
    smallThumb: json['small_thumb'] == null
        ? null
        : SmallThumb.fromJson(json['small_thumb']),
    largeThumb: json['large_thumb'] == null
        ? null
        : LargeThumb.fromJson(json['large_thumb']),
    hugeThumb: json['huge_thumb'] == null
        ? null
        : HugeThumb.fromJson(json['huge_thumb']),
    preview1000: json['preview_1000'] == null
        ? null
        : Preview_1000.fromJson(json['preview_1000']),
    preview1500: json['preview_1500'] == null
        ? null
        : Preview_1500.fromJson(json['preview_1500']),
  );
}

Map<String, dynamic> _$AssetsToJson(Assets instance) => <String, dynamic>{
      'preview': instance.preview?.toJson(),
      'small_thumb': instance.smallThumb?.toJson(),
      'large_thumb': instance.largeThumb?.toJson(),
      'huge_thumb': instance.hugeThumb?.toJson(),
      'preview_1000': instance.preview1000?.toJson(),
      'preview_1500': instance.preview1500?.toJson(),
    };
