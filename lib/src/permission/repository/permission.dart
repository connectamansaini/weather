import 'package:permission_handler/permission_handler.dart';

class PermissionRepository {
  Future<bool> getLocationPermission() async {
    final hasPermission = await Permission.location.isGranted;

    if (hasPermission) {
      return true;
    } else {
      final permission = await Permission.location.request();
      
      if (permission.isDenied) {
        return false;
      } else {
        return true;
      }
    }
  }
}
