part of 'splash_bloc.dart';

class SplashState {
  ConnectionsStatus connectionsStatus;

  SplashState({required this.connectionsStatus});

  SplashState copyWith({
    ConnectionsStatus? newConnectionStatus,
  }) {
    return SplashState(
        connectionsStatus: newConnectionStatus ?? connectionsStatus);
  }
}
