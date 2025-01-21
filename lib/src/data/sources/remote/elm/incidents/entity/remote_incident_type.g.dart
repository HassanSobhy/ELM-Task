// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_incident_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIncidentType _$RemoteIncidentTypeFromJson(Map<String, dynamic> json) =>
    RemoteIncidentType(
      id: (json['id'] as num?)?.toInt() ?? 0,
      arabicName: json['arabicName'] as String? ?? "",
      englishName: json['englishName'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteIncidentTypeToJson(RemoteIncidentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
    };
