import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> askPermission(Permission permission) async {
  PermissionStatus status = await permission.status;
  if (status.isGranted) return status;
  status = await permission.request();

  return status;
}

Permission getCameraPermission() {
  return Permission.camera;
}

Permission getSingleImageGalleryPermission() {
  if (Platform.isAndroid) {
    return Permission.camera;
  } else {
    return Permission.photos;
  }
}
