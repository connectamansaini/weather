// ignore_for_file: false
part of 'permission_bloc.dart';

enum PermissionStatus { none, granted, denied }

class PermissionState extends Equatable {
  const PermissionState({
    this.locationStatus = PermissionStatus.none,
  });

  final PermissionStatus locationStatus;

  @override
  List<Object> get props => [locationStatus];

  PermissionState copyWith({
    PermissionStatus? locationStatus,
  }) {
    return PermissionState(
      locationStatus: locationStatus ?? this.locationStatus,
    );
  }
}
