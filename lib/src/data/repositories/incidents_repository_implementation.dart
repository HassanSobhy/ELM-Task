import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_dashboard.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_type.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incidents.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/incidents_api_service.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/request/change_incident_status_request.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/request/submit_incident_request.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_dashboard.dart';
import 'package:elm_task/src/domain/entity/incidents/incident_type_credential.dart';
import 'package:elm_task/src/domain/entity/incidents/incidents.dart';
import 'package:elm_task/src/domain/entity/incidents/submit_incident_form.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';

class IncidentsRepositoryImplementation implements IncidentsRepository {
  final IncidentsAPIService _incidentsAPIService;

  IncidentsRepositoryImplementation(this._incidentsAPIService);

  @override
  Future<DataState<Incidents>> getIncidents() async {
    try {
      final httpResponse = await _incidentsAPIService.getIncidents();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
        );
      }

      return DataFailed(
        message: "Something went wrong",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<List<IncidentType>>> getIncidentTypes() async {
    try {
      final httpResponse = await _incidentsAPIService.getIncidentsTypes();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
        );
      }

      return DataFailed(
        message: "Something went wrong",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<Incident>> changeIncidentStatus(
    String id,
    int status,
  ) async {
    try {
      final httpResponse = await _incidentsAPIService.changeIncidentStatus(
        ChangeIncidentStatusRequest(
          incidentId: id,
          status: status,
        ),
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
          message: "Incident status changed successfully",
        );
      }

      return DataFailed(
        message: "Something went wrong",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<Incidents>> submitIncident(SubmitIncidentForm form) async {
    try {
      final httpResponse = await _incidentsAPIService.submitIncident(
        form.toRequest(),
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
          message: "Incident submitted successfully",
        );
      }

      return DataFailed(
        message: "Something went wrong",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<String>> uploadIncidentImage(String imagePath) async {
    try {
      MultipartFile images = await MultipartFile.fromFile(
        imagePath,
        filename: "image.jpg",
      );
      final httpResponse = await _incidentsAPIService.uploadIncidentImage(
        [
          images,
        ],
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: "Success",
          message: "Success",
        );
      }

      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong",
      );
    }
  }

  @override
  Future<DataState<IncidentDashboard>> getIncidentsDashboard() async {
    try {
      final httpResponse = await _incidentsAPIService.getIncidentsDashboard();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
        );
      }

      return DataFailed(
        message: "Something went wrong",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }
}
