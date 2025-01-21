import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_incident_type.g.dart';

@JsonSerializable()
class RemoteIncidentType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'arabicName')
  final String? arabicName;
  @JsonKey(name: 'englishName')
  final String? englishName;

  const RemoteIncidentType({
    this.id = 0,
    this.arabicName = "",
    this.englishName = "",
  });

  factory RemoteIncidentType.fromJson(Map<String, dynamic> json) =>
      _$RemoteIncidentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIncidentTypeToJson(this);
}


extension RemoteIncidentTypeExtension on RemoteIncidentType {
  IncidentType mapToDomain() {
    return IncidentType(
      id: id ?? 0,
      arabicName: arabicName ?? "",
      englishName: englishName ?? "",
    );
  }
}

extension RemoteIncidentTypeListExtension on List<RemoteIncidentType> {
  List<IncidentType> mapToDomain() {
    return map((e) => e.mapToDomain()).toList();
  }
}