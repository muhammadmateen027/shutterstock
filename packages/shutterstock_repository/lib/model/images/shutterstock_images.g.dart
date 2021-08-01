// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shutterstock_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShutterstockImages _$ShutterstockImagesFromJson(Map<String, dynamic> json) {
  return ShutterstockImages(
    page: json['page'] as int?,
    perPage: json['per_page'] as int?,
    totalCount: json['total_count'] as int?,
    searchId: json['search_id'] as String?,
    data:
        (json['data'] as List<dynamic>?)?.map((e) => Data.fromJson(e)).toList(),
  );
}

Map<String, dynamic> _$ShutterstockImagesToJson(ShutterstockImages instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_count': instance.totalCount,
      'search_id': instance.searchId,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
