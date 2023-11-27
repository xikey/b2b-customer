import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../common/params/login_admin_params.dart';
import '../../../../common/resources/data_state.dart';
import '../../repository/auth_repository.dart';

part 'login_state.dart';

part 'login_status.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository authRepository;

  LoginCubit(
    this.authRepository,
  ) : super(LoginState(loginStatus: AdminMode()));

  void loginAdmin(LoginAdminParams loginAdminParams) async {
    emit(state.copyWith(newLoginStatus: LoadingStatus()));
    final DataState dataState =
        await authRepository.loginAdmin(loginAdminParams);

    emit(state.copyWith(newLoginStatus: LoginAdminStatus(dataState)));
  }
}
