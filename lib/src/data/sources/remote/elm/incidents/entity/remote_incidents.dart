import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incidents.g.dart';

@JsonSerializable()
class RemoteIncidents {
  @JsonKey(name: 'incidents')
  final List<RemoteIncident>? incidents;

  const RemoteIncidents({
    this.incidents = const [],
  });

  factory RemoteIncidents.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentsToJson(this);
}


extension RemoteIncidentsExtension on RemoteIncidents {
  Incidents mapToDomain() {
    return Incidents(
      incidents: incidents?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}