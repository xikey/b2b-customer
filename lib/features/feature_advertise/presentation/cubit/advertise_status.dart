part of 'advertise_cubit.dart';

@immutable
abstract class AdvertiseStatus {}

class InitialStatus extends AdvertiseStatus {}

class LoadingStatus extends AdvertiseStatus {}

class GetAdvertisesStatus extends AdvertiseStatus {
  final DataState dataState;

  GetAdvertisesStatus(this.dataState);
}

class AddAdvertisesStatus extends AdvertiseStatus {
  final DataState dataState;

  AddAdvertisesStatus(this.dataState);
}

class ActiveAdvertisesStatus extends AdvertiseStatus {
  final DataState dataState;
  final Advertise advertise;

  ActiveAdvertisesStatus(this.dataState, this.advertise);
}

class FilterListAndReload extends AdvertiseStatus {
  final FilterAdvertise filterAdvertise;

  FilterListAndReload({
    required this.filterAdvertise,
  });
}

class Reload extends AdvertiseStatus {
  final XFile? image;

  Reload(this.image);
}
