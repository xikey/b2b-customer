import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/basket/basket_widget.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/categories/categories_widget.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/test_view_widget.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/vitrin/vitrin_widget.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import 'package:badges/badges.dart' as badges;

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    BlocProvider.of<ProductCubit>(context).reloadBasketBudge();

    Widget mainWidgetSelector(int index) {
      if (index == 0) {
        return const VitrinWidget();
      } else if (index == 1) {
        return const CategoriesWidget();
      } else if (index == 2) {
        return const BasketWidget();
      }
      return const VitrinWidget();
    }

    return DelayedWidget(
      delayDuration: const Duration(milliseconds: 200),
      animationDuration: const Duration(milliseconds: 1000),
      animation: DelayedAnimations.SLIDE_FROM_TOP,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.homeStatus is BottomNavIndex) {
            final data = state.homeStatus as BottomNavIndex;
            selectedIndex = data.index;
          }

          return Center(
              child: ClipRRect(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey,
              child: Column(
                children: [
                  Expanded(
                    child: mainWidgetSelector(selectedIndex),
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  BottomNavigationBar(
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedItemColor: AppColors.yadegar_1,
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    selectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    unselectedItemColor: Colors.black38,
                    items: <BottomNavigationBarItem>[
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded),
                        label: 'خانه',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.category_rounded),
                        label: 'دسته بندی',
                      ),
                      BottomNavigationBarItem(
                        icon: BlocBuilder<ProductCubit, ProductState>(
                          buildWhen: (previous, current)=>current.productStatus is ReloadBasketBadge,
                          builder: (context, state) {
                            int itemCount =
                                0; // Initialize with a default value
                            if (state.productStatus is ReloadBasketBadge) {
                              final status =
                                  state.productStatus as ReloadBasketBadge;
                              itemCount = status.count;
                            }

                            return badges.Badge(
                              badgeContent: Text(
                                '$itemCount',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              child: const Icon(Icons.shopping_basket_rounded),
                            );
                          },
                        ),
                        label: 'سبد خرید',
                      ),

                    ],
                    currentIndex: selectedIndex,
                    onTap: (index) {
                      BlocProvider.of<HomeCubit>(context)
                          .changeBottomNav(index);
                    },
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
