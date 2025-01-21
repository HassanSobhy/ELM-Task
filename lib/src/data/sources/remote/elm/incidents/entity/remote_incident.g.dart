// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIncident _$RemoteIncidentFromJson(Map<String, dynamic> json) =>
    RemoteIncident(
      id: json['id'] as String? ?? "",
      description: json['description'] as String? ?? "",
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      typeId: (json['typeId'] as num?)?.toInt() ?? 0,
      issuerId: json['issuerId'] as String? ?? "",
      assigneeId: json['assigneeId'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updatedAt: json['updatedAt'] as String? ?? "",
      medias: (json['medias'] as List<dynamic>?)
              ?.map((e) => RemoteMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteIncidentToJson(RemoteIncident instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'priority': instance.priority,
      'typeId': instance.typeId,
      'issuerId': instance.issuerId,
      'assigneeId': instance.assigneeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'medias': instance.medias,
    };
