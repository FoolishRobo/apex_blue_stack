import 'package:json_annotation/json_annotation.dart';

part 'recomendation.g.dart';

@JsonSerializable()
class Recomendation {
  String cursor;
  List<RecomendationItem> tournaments;

  Recomendation({
    this.cursor,
    this.tournaments,
  });

  factory Recomendation.fromJson(Map<String, dynamic> json) =>
      _$RecomendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecomendationToJson(this);
}

@JsonSerializable()
class RecomendationItem {
  String name;
  @JsonKey(name: 'game_name')
  String gameName;
  @JsonKey(name: 'cover_url')
  String coverUrl;

  RecomendationItem({
    this.name,
    this.gameName,
    this.coverUrl,
  });

  factory RecomendationItem.fromJson(Map<String, dynamic> json) =>
      _$RecomendationItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecomendationItemToJson(this);
}
