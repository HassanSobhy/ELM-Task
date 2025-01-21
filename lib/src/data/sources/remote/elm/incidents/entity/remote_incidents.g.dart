// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_incidents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIncidents _$RemoteIncidentsFromJson(Map<String, dynamic> json) =>
    RemoteIncidents(
      incidents: (json['incidents'] as List<dynamic>?)
              ?.map((e) => RemoteIncident.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteIncidentsToJson(RemoteIncidents instance) =>
    <String, dynamic>{
      'incidents': instance.incidents,
    };
