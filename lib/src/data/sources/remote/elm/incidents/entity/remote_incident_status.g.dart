// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_incident_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIncidentStatus _$RemoteIncidentStatusFromJson(
        Map<String, dynamic> json) =>
    RemoteIncidentStatus(
      status: (json['status'] as num?)?.toInt() ?? 0,
      count: json['_count'] == null
          ? const RemoteIncidentCount()
          : RemoteIncidentCount.fromJson(
              json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteIncidentStatusToJson(
        RemoteIncidentStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      '_count': instance.count,
    };
