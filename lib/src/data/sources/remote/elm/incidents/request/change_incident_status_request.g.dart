// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_incident_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeIncidentStatusRequest _$ChangeIncidentStatusRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeIncidentStatusRequest(
      incidentId: json['incidentId'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$ChangeIncidentStatusRequestToJson(
        ChangeIncidentStatusRequest instance) =>
    <String, dynamic>{
      'incidentId': instance.incidentId,
      'status': instance.status,
    };
