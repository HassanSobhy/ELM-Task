import 'package:dio/dio.dart';
import 'package:elm_task/src/data/sources/remote/elm/api_keys.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_dashboard.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incident_type.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/entity/remote_incidents.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/request/change_incident_status_request.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/request/submit_incident_request.dart';
import 'package:retrofit/retrofit.dart';

part 'incidents_api_service.g.dart';

@RestApi()
abstract class IncidentsAPIService {
  factory IncidentsAPIService(Dio dio) = _IncidentsAPIService;

  @GET(APIKeys.incident)
  Future<HttpResponse<RemoteIncidents>> getIncidents();

  @GET(APIKeys.incidentTypes)
  Future<HttpResponse<List<RemoteIncidentType>>> getIncidentsTypes();

  @POST(APIKeys.incident)
  Future<HttpResponse<RemoteIncidents>> submitIncident(
    @Body() SubmitIncidentRequest request,
  );

  @PUT(APIKeys.changeIncidentStatus)
  Future<HttpResponse<RemoteIncident>> changeIncidentStatus(
    @Body() ChangeIncidentStatusRequest request,
  );

  @POST(APIKeys.uploadIncidentImage)
  @MultiPart()
  Future<HttpResponse> uploadIncidentImage(
    @Part(name: "image") List<MultipartFile> files,
  );

  @GET(APIKeys.dashboard)
  Future<HttpResponse<RemoteIncidentDashboard>> getIncidentsDashboard();
}
