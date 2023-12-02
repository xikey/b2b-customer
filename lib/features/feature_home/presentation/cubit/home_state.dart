part of 'home_cubit.dart';

class HomeState {
  HomeStatus homeStatus;

  HomeState({required this.homeStatus});

  HomeState copyWith({
    HomeStatus? newStatus,
  }) {
    return HomeState(homeStatus: newStatus ?? homeStatus);
  }
}
