import 'package:elm_task/src/presentation/screens/add_incident/add_incident_screen.dart';
import 'package:elm_task/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:elm_task/src/presentation/screens/incident_details/incident_details_screen.dart';
import 'package:elm_task/src/presentation/screens/incidents/incidents_screen.dart';
import 'package:elm_task/src/presentation/screens/login/login_screen.dart';
import 'package:elm_task/src/presentation/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = "/login";
  static const String otp = "/otp";
  static const String incidents = "/incidents";
  static const String addIncident = "/addIncident";
  static const String dashboard = "/dashboard";
  static const String incidentDetails = "/incidentDetails";
}

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return _materialRoute(LoginScreen());
      case Routes.otp:
        Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(OtpScreen(email: args["email"]));
      case Routes.incidents:
        return _materialRoute(IncidentScreen());
      case Routes.addIncident:
        return _materialRoute(AddIncidentScreen());
      case Routes.dashboard:
        return _materialRoute(DashboardScreen());
      case Routes.incidentDetails:
        Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
            IncidentDetailsScreen(incident: args["incident"]));
      default:
        return unDefinedRoute(routeSettings.name ?? "");
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text(name),
        ),
      ),
    );
  }
}
