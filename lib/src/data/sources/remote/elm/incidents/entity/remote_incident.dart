import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_media.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incident.g.dart';

@JsonSerializable()
class RemoteIncident {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'priority')
  final int? priority;
  @JsonKey(name: 'typeId')
  final int? typeId;
  @JsonKey(name: 'issuerId')
  final String? issuerId;
  @JsonKey(name: 'assigneeId')
  final String? assigneeId;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: 'medias')
  final List<RemoteMedia>? medias;

  const RemoteIncident({
    this.id = "",
    this.description = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.status = 0,
    this.priority = 0,
    this.typeId = 0,
    this.issuerId = "",
    this.assigneeId = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.medias = const [],
  });

  factory RemoteIncident.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentToJson(this);
}


extension RemoteIncidentExtension on RemoteIncident {
  Incident mapToDomain() {
    return Incident(
      id: id ?? "",
      description: description ?? "",
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,
      status: status ?? 0,
      priority: priority ?? 0,
      typeId: typeId ?? 0,
      issuerId: issuerId ?? "",
      assigneeId: assigneeId ?? "",
      createdAt: createdAt ?? "",
      updatedAt: updatedAt ?? "",
      media: medias?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}
