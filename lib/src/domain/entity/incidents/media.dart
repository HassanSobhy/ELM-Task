import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final String id;
  final String mimeType;
  final String url;
  final int type;
  final String incidentId;

  const Media({
    this.id = "",
    this.mimeType = "",
    this.url = "",
    this.type = 0,
    this.incidentId = "",
  });

  @override
  List<Object> get props => [
        id,
        mimeType,
        url,
        type,
        incidentId,
      ];
}
