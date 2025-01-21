// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_incident_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitIncidentRequest _$SubmitIncidentRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitIncidentRequest(
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: (json['status'] as num).toInt(),
      typeId: (json['typeId'] as num).toInt(),
      priority: (json['priority'] as num).toInt(),
      issuerId: json['issuerId'] as String,
    );

Map<String, dynamic> _$SubmitIncidentRequestToJson(
        SubmitIncidentRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'typeId': instance.typeId,
      'priority': instance.priority,
      'issuerId': instance.issuerId,
    };
