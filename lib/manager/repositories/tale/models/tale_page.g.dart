// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tale_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TalePageImpl _$$TalePageImplFromJson(Map<String, dynamic> json) =>
    _$TalePageImpl(
      id: json['id'] as String,
      taleId: json['tale_id'] as String,
      pageNumber: (json['page_number'] as num).toInt(),
      text: json['text'] as String,
      backgroundImage: json['background_image'] as String,
      backgroundAudio: json['background_audio'] as String? ?? '',
      taleInteractions: (json['tale_interactions'] as List<dynamic>?)
              ?.map((e) => TaleInteraction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TalePageImplToJson(_$TalePageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tale_id': instance.taleId,
      'page_number': instance.pageNumber,
      'text': instance.text,
      'background_image': instance.backgroundImage,
      'background_audio': instance.backgroundAudio,
      'tale_interactions': instance.taleInteractions,
    };
