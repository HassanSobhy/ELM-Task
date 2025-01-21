// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_incident_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIncidentDashboard _$RemoteIncidentDashboardFromJson(
        Map<String, dynamic> json) =>
    RemoteIncidentDashboard(
      incidents: (json['incidents'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteIncidentStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteIncidentDashboardToJson(
        RemoteIncidentDashboard instance) =>
    <String, dynamic>{
      'incidents': instance.incidents,
    };
