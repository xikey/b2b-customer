import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/test_view_widget.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/vitrin/vitrin_widget.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    Widget mainWidgetSelector(int index) {
      if (index == 0) {
        return const VitrinWidget();
      } else if (index == 1) {
        return const TestViewWidget(
          name: 'index 1',
          color: Colors.blue,
        );
      } else if (index == 2) {
        return const TestViewWidget(
          name: 'index 2',
          color: Colors.red,
        );
      } else {
        return const TestViewWidget(
          name: 'index 3',
          color: Colors.yellowAccent,
        );
      }
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
                    child: SingleChildScrollView(
                        child: mainWidgetSelector(selectedIndex)),
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
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded),
                        label: 'خانه',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category_rounded),
                        label: 'دسته بندی',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_basket_rounded),
                        label: 'سبد خرید',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_rounded),
                        label: 'پروفایل',
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
