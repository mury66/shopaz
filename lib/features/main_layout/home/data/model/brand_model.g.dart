// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => BrandData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  nextPage: (json['nextPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
  'nextPage': instance.nextPage,
};

BrandData _$BrandDataFromJson(Map<String, dynamic> json) => BrandData(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  updatedAt: json['updatedAt'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$BrandDataToJson(BrandData instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'updatedAt': instance.updatedAt,
  'createdAt': instance.createdAt,
};
