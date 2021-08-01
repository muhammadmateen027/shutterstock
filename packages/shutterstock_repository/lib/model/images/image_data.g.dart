// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as String?,
    aspect: (json['aspect'] as num?)?.toDouble(),
    assets: json['assets'] == null ? null : Assets.fromJson(json['assets']),
    description: json['description'] as String?,
    imageType: json['image_type'] as String?,
    hasModelRelease: json['has_model_release'] as bool?,
    mediaType: json['media_type'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'aspect': instance.aspect,
      'assets': instance.assets?.toJson(),
      'description': instance.description,
      'image_type': instance.imageType,
      'has_model_release': instance.hasModelRelease,
      'media_type': instance.mediaType,
    };
