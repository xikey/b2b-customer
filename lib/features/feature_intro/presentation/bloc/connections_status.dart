part of 'splash_bloc.dart';

@immutable
abstract class ConnectionsStatus {}

class ConnectionInitial extends ConnectionsStatus {}

class ConnectionOn extends ConnectionsStatus {}

class ConnectionOff extends ConnectionsStatus {}
