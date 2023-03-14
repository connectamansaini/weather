part of 'permission_bloc.dart';

enum PermissionStatus { none, granted, denied }

class PermissionState {
  const PermissionState({
    this.locationStatus = PermissionStatus.none,
  });

  final PermissionStatus locationStatus;

  PermissionState copyWith({
    PermissionStatus? locationStatus,
  }) {
    return PermissionState(
      locationStatus: locationStatus ?? this.locationStatus,
    );
  }
}
