// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recomendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recomendation _$RecomendationFromJson(Map<String, dynamic> json) {
  return Recomendation(
    cursor: json['cursor'] as String,
    tournaments: (json['tournaments'] as List)
        ?.map((e) => e == null
            ? null
            : RecomendationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecomendationToJson(Recomendation instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'tournaments': instance.tournaments,
    };

RecomendationItem _$RecomendationItemFromJson(Map<String, dynamic> json) {
  return RecomendationItem(
    name: json['name'] as String,
    gameName: json['game_name'] as String,
    coverUrl: json['cover_url'] as String,
  );
}

Map<String, dynamic> _$RecomendationItemToJson(RecomendationItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'game_name': instance.gameName,
      'cover_url': instance.coverUrl,
    };
