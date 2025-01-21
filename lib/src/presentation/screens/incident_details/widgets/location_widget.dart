import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/domain/entity/incidents/incident.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWidget extends StatelessWidget {
  final Incident incident;

  const LocationWidget({
    super.key,
    required this.incident,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).location,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                incident.latitude,
                incident.longitude,
              ),
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: MarkerId(incident.id),
                position: LatLng(
                  incident.latitude,
                  incident.longitude,
                ),
                infoWindow: InfoWindow(title: "Incident Location"),
              ),
            },
          ),
        ),
      ],
    );
  }
}
