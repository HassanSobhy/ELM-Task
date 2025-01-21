// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMedia _$RemoteMediaFromJson(Map<String, dynamic> json) => RemoteMedia(
      id: json['id'] as String? ?? "",
      mimeType: json['mimeType'] as String? ?? "",
      url: json['url'] as String? ?? "",
      type: (json['type'] as num?)?.toInt() ?? 0,
      incidentId: json['incidentId'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteMediaToJson(RemoteMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mimeType': instance.mimeType,
      'url': instance.url,
      'type': instance.type,
      'incidentId': instance.incidentId,
    };
