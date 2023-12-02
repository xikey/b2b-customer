import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

part 'home_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(homeStatus: HomeInitial()));

  // void loadMemberData() async {
  //   final User? model = await locator<PrefsOperator>().getUserData();
  //
  //   if (model != null) {
  //     emit(state.copyWith(newStatus: HomeData(data: DataSuccess(model))));
  //   } else {
  //     const DataFailed('خطا در دریافت اطلاعات کاربری');
  //   }
  // }

  void changeBottomNav(int index) {
    emit(state.copyWith(newStatus: BottomNavIndex(index: index)));
  }
}
