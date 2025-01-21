import 'package:elm_task/src/domain/entity/incidents/media.dart';
import 'package:equatable/equatable.dart';

class Incident extends Equatable {
  final String id;
  final String description;
  final double latitude;
  final double longitude;
  final int status;
  final int priority;
  final int typeId;
  final String issuerId;
  final String assigneeId;
  final String createdAt;
  final String updatedAt;
  final List<Media> media;

  const Incident({
    this.id = "",
    this.description = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.status = 0,
    this.priority = 0,
    this.issuerId = "",
    this.assigneeId = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.typeId = 0,
    this.media = const [],
  });

  @override
  List<Object> get props => [
        id,
        description,
        latitude,
        longitude,
        status,
        priority,
        typeId,
        issuerId,
        assigneeId,
        createdAt,
        updatedAt,
      ];
}
