import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/route/routes_manager.dart';
import 'package:elm_task/src/core/utils/bloc/main_bloc_observer.dart';
import 'package:elm_task/src/di/injector.dart';
import 'package:elm_task/src/domain/usecases/authentication/get_token_use_case.dart';
import 'package:elm_task/src/presentation/blocs/add_incident/add_incident_bloc.dart';
import 'package:elm_task/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:elm_task/src/presentation/blocs/incident_details/incident_details_cubit.dart';
import 'package:elm_task/src/presentation/blocs/incidents/incidents_bloc.dart';
import 'package:elm_task/src/presentation/blocs/login/login_bloc.dart';
import 'package:elm_task/src/presentation/blocs/otp/otp_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await _init();
  String initialRoute = await _determineInitialRoute();

  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  if (kDebugMode) {
    Bloc.observer = const MainBlocObserver();
  }
}

Future<String> _determineInitialRoute() async {
  bool isUserLogged = await _isUserLogged();
  if (isUserLogged) {
    return Routes.incidents;
  } else {
    return Routes.login;
  }
}

Future<bool> _isUserLogged() async {
  String token = await injector<GetTokenUseCase>()();
  return token.isNotEmpty;
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => injector()),
        BlocProvider<OtpBloc>(create: (context) => injector()),
        BlocProvider<IncidentsBloc>(create: (context) => injector()),
        BlocProvider<IncidentDetailsCubit>(create: (context) => injector()),
        BlocProvider<DashboardBloc>(create: (context) => injector()),
        BlocProvider<AddIncidentBloc>(create: (context) => injector()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ELM Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        themeMode: ThemeMode.light,
        initialRoute: initialRoute,
        onGenerateRoute: RoutesManager.getRoute,
        locale: Locale("en"),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
