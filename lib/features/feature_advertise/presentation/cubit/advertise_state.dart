part of 'advertise_cubit.dart';

class AdvertiseState {
  AdvertiseStatus advertiseStatus;

  AdvertiseState({required this.advertiseStatus});

  AdvertiseState copyWith({
    AdvertiseStatus? newStatus,
  }) {
    return AdvertiseState(advertiseStatus: newStatus ?? advertiseStatus);
  }
}
