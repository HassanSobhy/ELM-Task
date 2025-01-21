import 'package:elm_task/src/domain/entity/incidents/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_media.g.dart';

@JsonSerializable()
class RemoteMedia {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'mimeType')
  final String? mimeType;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'type')
  final int? type;
  @JsonKey(name: 'incidentId')
  final String? incidentId;

  const RemoteMedia({
    this.id = "",
    this.mimeType = "",
    this.url = "",
    this.type = 0,
    this.incidentId = "",
  });

  factory RemoteMedia.fromJson(Map<String, dynamic> json) =>
      _$RemoteMediaFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMediaToJson(this);
}


extension RemoteMediaExtension on RemoteMedia {
  Media mapToDomain() {
    return Media(
      id: id ?? "",
      mimeType: mimeType ?? "",
      url: url ?? "",
      type: type ?? 0,
      incidentId: incidentId ?? "",
    );
  }
}
