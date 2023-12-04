import 'package:b2b_customer/common/resources/data_state.dart';
import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/features/feature_advertise/presentation/cubit/advertise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/model/image_slider_item.dart';
import '../../../../../common/widgets/dot_loading_widget.dart';
import '../../../../../common/widgets/searchbar_widget.dart';
import '../../../../feature_advertise/data/model/advertise.dart';
import 'category/category_tags.dart';
import 'image_slider/image_slider.dart';

class VitrinWidget extends StatelessWidget {
  const VitrinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Advertise> topAdvertises = [];
    List<Advertise> mainAdvertises = [];
    List<Advertise> bottomAdvertises = [];
    BlocProvider.of<AdvertiseCubit>(context).getAllAdvertises();

    return BlocConsumer<AdvertiseCubit, AdvertiseState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.advertiseStatus is GetAdvertisesStatus) {
          final status = state.advertiseStatus as GetAdvertisesStatus;
          if (status.dataState is DataSuccess) {
            final list = status.dataState.data as List<Advertise>;
            if (list.isNotEmpty) {
              topAdvertises = list.where((ad) => ad.position == "top").toList();
            }
          }
        }
        if (state.advertiseStatus is LoadingStatus) {
          return const DotLoadingWidget(size: 40);
        }

        if (topAdvertises.isNotEmpty) {
          return Container(
            color: Colors.white,
            child: Center(
                child: Column(
              children: [
                SearchBarWidget(
                  onTap: () {},
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final List<ImageSliderItem> imageSliderItems = [];
                    topAdvertises.forEach((element) {
                      imageSliderItems.add(ImageSliderItem(
                          imageUrl: element.getImageUrl(), uri: element.url));
                    });

                    double height = constraints.maxWidth / 3;
                    if (height < 200) {
                      height = 200;
                    }
                    if (height > 400) {
                      height = 400;
                    }

                    return Container(
                      color: Colors.white,
                      child: ImageSlider(
                        hegiht: height,
                        items: imageSliderItems,
                      ),
                    );
                  },
                ),
                const CategoryTagsWidget(
                  count: 4,
                ),
                //   Text(name)
              ],
            )),
          );
        }
        return SizedBox();
      },
    );
  }
}
