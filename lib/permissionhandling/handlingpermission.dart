import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  // Check the current status of the camera permission
  PermissionStatus cameraStatus = await Permission.camera.status;

  // Handle if permission is denied
  if (cameraStatus.isDenied) {
    // Request camera permission if denied
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      print('Camera permission granted');
    } else {
      print('Camera permission denied');
    }
  } else {
    // If permission is already granted, print a message
    print('Camera permission is already granted');
  }

  // Check for location permission status
  PermissionStatus locationStatus = await Permission.location.status;

  // Handle if location permission is denied
  if (locationStatus.isDenied) {
    // Request location permission if denied
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      print('Location permission granted');
    } else {
      print('Location permission denied');
    }
  } else {
    // If location permission is already granted, print a message
    print('Location permission is already granted');
  }
}

// Function to check and handle permanently denied permissions
Future<void> checkAndHandlePermanentDenial() async {
  if (await Permission.camera.isPermanentlyDenied) {
    print("Camera permission is permanently denied. Please open settings.");
    openAppSettings();
  }

  if (await Permission.location.isPermanentlyDenied) {
    print("Location permission is permanently denied. Please open settings.");
    openAppSettings();
  }
}
