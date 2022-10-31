import 'package:geolocator/geolocator.dart';
import 'package:weather/src/location/models/location.dart';

class LocationRepository {
  Future<Location> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      rethrow;
    }
  }
}
