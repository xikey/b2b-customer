
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/platform_manager.dart';
import '../../../../locator.dart';
import '../../repository/splash_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

part 'connections_status.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState(connectionsStatus: ConnectionInitial())) {
    on<CheckConnectionEvent>((event, emit) async {
      if (locator<PlatformManager>().isWeb) {
        emit(state.copyWith(newConnectionStatus: ConnectionOn()));
      } else {
        bool isConnect = await locator<SplashRepository>().checkConnectivity();

        if (isConnect) {
          emit(state.copyWith(newConnectionStatus: ConnectionOn()));
        } else {
          emit(state.copyWith(newConnectionStatus: ConnectionOff()));
        }
      }
    });
  }
}
