part of 'home_cubit.dart';

@immutable
abstract class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

// class HomeData extends HomeStatus {
//   DataState<User> data;
//
//   HomeData({required this.data});
// }

class BottomNavIndex extends HomeStatus {
  final int index;

  BottomNavIndex({required this.index});
}
