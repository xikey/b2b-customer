// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginStatus {}

class LoginInitial extends LoginStatus {}

class AdminMode extends LoginStatus {}

class LoadingStatus extends LoginStatus {}

class LoginAdminStatus extends LoginStatus {
  final DataState dataState;

  LoginAdminStatus(this.dataState);
}

class FailedLoadingData extends LoginStatus {
  final DataFailed dataFailed;

  FailedLoadingData(this.dataFailed);
}


