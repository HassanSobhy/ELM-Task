import 'package:dio/dio.dart';
import 'package:elm_task/src/core/utils/network/custom_interceptors.dart';
import 'package:elm_task/src/data/repositories/authentication_repository_implementation.dart';
import 'package:elm_task/src/data/repositories/incidents_repository_implementation.dart';
import 'package:elm_task/src/data/sources/local/secure_storage/authentication_secure_storage.dart';
import 'package:elm_task/src/data/sources/local/secure_storage/authentication_secure_storage_impl.dart';
import 'package:elm_task/src/data/sources/remote/elm/api_keys.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/authentication_api_service.dart';
import 'package:elm_task/src/data/sources/remote/elm/incidents/incidents_api_service.dart';
import 'package:elm_task/src/domain/repositories/authentication_repository.dart';
import 'package:elm_task/src/domain/repositories/incidents_repository.dart';
import 'package:elm_task/src/domain/usecases/authentication/delete_token_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/get_token_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/login_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/save_token_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/validate_email_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/verify_otp_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/change_incident_status_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/filter_incidents_by_status_and_date_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incident_dashboard_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incident_tpyes_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/get_incidents_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/submit_incident_use_case.dart';
import 'package:elm_task/src/domain/usecases/incidents/upload_incident_image_use_case.dart';
import 'package:elm_task/src/presentation/blocs/add_incident/add_incident_bloc.dart';
import 'package:elm_task/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:elm_task/src/presentation/blocs/incident_details/incident_details_cubit.dart';
import 'package:elm_task/src/presentation/blocs/incidents/incidents_bloc.dart';
import 'package:elm_task/src/presentation/blocs/login/login_bloc.dart';
import 'package:elm_task/src/presentation/blocs/otp/otp_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(
    () => Dio()
      ..options.baseUrl = APIKeys.baseUrl
      ..interceptors.add(
        CustomInterceptors(),
      ),
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final storage = FlutterSecureStorage(aOptions: getAndroidOptions());

  injector.registerSingleton<FlutterSecureStorage>(storage);

  injector.registerSingleton<AuthenticationSecureStorage>(
    AuthenticationSecureStorageImpl(injector()),
  );

  injector.registerSingleton<AuthenticationAPIService>(
    AuthenticationAPIService(injector()),
  );

  injector.registerSingleton<IncidentsAPIService>(
    IncidentsAPIService(injector()),
  );

  injector.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImplementation(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<IncidentsRepository>(
    () => IncidentsRepositoryImplementation(
      injector(),
    ),
  );

  injector.registerFactory<ValidateEmailUseCase>(
    () => ValidateEmailUseCase(),
  );

  injector.registerFactory<LoginUseCase>(
    () => LoginUseCase(injector()),
  );

  injector.registerFactory<SaveTokenUseCase>(
    () => SaveTokenUseCase(injector()),
  );

  injector.registerFactory<GetTokenUseCase>(
    () => GetTokenUseCase(injector()),
  );

  injector.registerFactory<DeleteTokenUseCase>(
        () => DeleteTokenUseCase(injector()),
  );

  injector.registerFactory<VerifyOTPUseCase>(
    () => VerifyOTPUseCase(injector()),
  );

  injector.registerFactory<GetIncidentsUseCase>(
    () => GetIncidentsUseCase(injector()),
  );

  injector.registerFactory<GetIncidentTypesUseCase>(
    () => GetIncidentTypesUseCase(injector()),
  );

  injector.registerFactory<ChangeIncidentStatusUseCase>(
    () => ChangeIncidentStatusUseCase(injector()),
  );

  injector.registerFactory<SubmitIncidentUseCase>(
    () => SubmitIncidentUseCase(injector()),
  );

  injector.registerFactory<UploadIncidentImageUseCase>(
    () => UploadIncidentImageUseCase(injector()),
  );

  injector.registerFactory<GetIncidentDashboardUseCase>(
    () => GetIncidentDashboardUseCase(injector()),
  );

  injector.registerFactory<FilterIncidentsByStatusAndDateUseCase>(
    () => FilterIncidentsByStatusAndDateUseCase(),
  );

  injector.registerFactory<LoginBloc>(
    () => LoginBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<OtpBloc>(
    () => OtpBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<IncidentsBloc>(
    () => IncidentsBloc(
      injector(),
      injector(),
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<IncidentDetailsCubit>(
    () => IncidentDetailsCubit(
      injector(),
    ),
  );

  injector.registerFactory<DashboardBloc>(
    () => DashboardBloc(
      injector(),
    ),
  );

  injector.registerFactory<AddIncidentBloc>(
        () => AddIncidentBloc(
      injector(),
      injector(),
      injector(),
    ),
  );
}
