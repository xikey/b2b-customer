
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/prefs_operator.dart';
import '../../../../locator.dart';
import '../../data/model/advertise.dart';
import '../../data/model/filter_advertise.dart';
import '../../repository/advertise_repository.dart';

part 'advertise_state.dart';

part 'advertise_status.dart';

class AdvertiseCubit extends Cubit<AdvertiseState> {
  AdvertiseRepository advertiseRepository;

  AdvertiseCubit(
    this.advertiseRepository,
  ) : super(AdvertiseState(advertiseStatus: InitialStatus()));

  void getAllAdvertises() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await advertiseRepository.getAllAdvertises(token);

    emit(state.copyWith(newStatus: GetAdvertisesStatus(dataState)));
  }


  void reload(XFile? selectedImage) async {
    emit(state.copyWith(newStatus: Reload(selectedImage)));
  }


  void filterAndReload(FilterAdvertise filterAdvertise) {
    emit(state.copyWith(newStatus: LoadingStatus()));
    emit(state.copyWith(
        newStatus: FilterListAndReload(filterAdvertise: filterAdvertise)));
  }
}
