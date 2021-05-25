// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    url: json['url'] as String,
    rating: json['rating'] as int,
    tournamentPlayed: json['tournamentPlayed'] as int,
    tournamentWon: json['tournamentWon'] as int,
    tournamentPercentage: (json['tournamentPercentage'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'url': instance.url,
      'rating': instance.rating,
      'tournamentPlayed': instance.tournamentPlayed,
      'tournamentWon': instance.tournamentWon,
      'tournamentPercentage': instance.tournamentPercentage,
    };
