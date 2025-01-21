import 'package:equatable/equatable.dart';

class IncidentType extends Equatable {
  final int id;
  final String arabicName;
  final String englishName;

  const IncidentType({
    this.id = 0,
    this.arabicName = "",
    this.englishName = "",
  });

  @override
  List<Object> get props => [
        id,
        arabicName,
        englishName,
      ];
}
