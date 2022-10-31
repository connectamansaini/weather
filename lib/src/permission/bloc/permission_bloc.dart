import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/permission/repository/permission.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc(
    this.permissionRepository,
  ) : super(const PermissionState()) {
    on<LocationPermissionRequested>(_onLocationPermissionRequested);
  }
  final PermissionRepository permissionRepository;

  Future<void> _onLocationPermissionRequested(
    LocationPermissionRequested event,
    Emitter<PermissionState> emit,
  ) async {
    final permission = await permissionRepository.getLocationPermission();
    
    emit(
      state.copyWith(
        locationStatus:
            permission ? PermissionStatus.granted : PermissionStatus.denied,
      ),
    );
  }
}
