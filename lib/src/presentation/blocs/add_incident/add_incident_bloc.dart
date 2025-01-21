import 'dart:async';

import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incident_tpyes_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/submit_incident_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/upload_incident_image_use_case.dart';
import 'package:elm_task/src/presentation/screens/incidents/utils/status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_incident_event.dart';

part 'add_incident_state.dart';

class AddIncidentBloc extends Bloc<AddIncidentEvent, AddIncidentState> {
  final GetIncidentTypesUseCase _getIncidentTypesUseCase;
  final SubmitIncidentUseCase _submitIncidentUseCase;
  final UploadIncidentImageUseCase _uploadIncidentImageUseCase;

  AddIncidentBloc(
    this._getIncidentTypesUseCase,
    this._submitIncidentUseCase,
    this._uploadIncidentImageUseCase,
  ) : super(AddIncidentInitial()) {
    on<GetIncidentTypesEvent>(_onGetIncidentTypesEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectIncidentTypeEvent>(_onSelectIncidentTypeEvent);
    on<UploadImageEvent>(_onUploadImageEvent);
    on<AddNewIncidentEvent>(_onAddNewIncidentEvent);
  }

  FutureOr<void> _onGetIncidentTypesEvent(
    GetIncidentTypesEvent event,
    Emitter<AddIncidentState> emit,
  ) async {
    emit(ShowLoadingState());
    final result = await _getIncidentTypesUseCase();

    if (result is DataSuccess) {
      emit(GetIncidentTypesSuccessState(
        incidentTypes: result.data ?? [],
      ));
    } else {
      emit(GetIncidentTypesErrorState(
        message: result.message ?? "",
      ));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectStatusEvent(
    SelectStatusEvent event,
    Emitter<AddIncidentState> emit,
  ) {
    emit(SelectIncidentStatus(
      status: event.status,
    ));
  }

  FutureOr<void> _onSelectIncidentTypeEvent(
    SelectIncidentTypeEvent event,
    Emitter<AddIncidentState> emit,
  ) {
    emit(SelectIncidentType(
      incidentType: event.incidentType,
    ));
  }

  FutureOr<void> _onUploadImageEvent(
    UploadImageEvent event,
    Emitter<AddIncidentState> emit,
  ) async {
    emit(ShowLoadingState());
    final result = await _uploadIncidentImageUseCase(event.imagePath);

    if (result is DataSuccess) {
      emit(UploadImageSuccessState(
        message: result.message ?? "",
      ));
    } else {
      emit(UploadImageErrorState(
        message: result.message ?? "",
      ));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onAddNewIncidentEvent(
    AddNewIncidentEvent event,
    Emitter<AddIncidentState> emit,
  ) async {
    emit(ShowLoadingState());
    final result = await _submitIncidentUseCase(event.form);

    if (result is DataSuccess) {
      emit(AddIncidentSuccessState(
        incidents: result.data ?? Incidents(),
        message: result.message ?? "",
      ));
    } else {
      emit(AddIncidentErrorState(
        message: result.message ?? "",
      ));
    }

    emit(HideLoadingState());
  }
}
