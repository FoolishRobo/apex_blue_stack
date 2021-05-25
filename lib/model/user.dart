import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String firstName;
  String lastName;
  String url;
  int rating;
  int tournamentPlayed;
  int tournamentWon;
  double tournamentPercentage;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.url,
    this.rating,
    this.tournamentPlayed,
    this.tournamentWon,
    this.tournamentPercentage,
  });

  get fullName {
    return "$firstName $lastName";
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
