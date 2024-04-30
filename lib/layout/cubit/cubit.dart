import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/airplane/airplane_screen.dart';
import 'package:travel_agency_app/modules/home/home_screen.dart';
import 'package:travel_agency_app/layout/cubit/states.dart';
import 'package:travel_agency_app/modules/hotels/hotels_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/images/Home.svg',
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/images/airplane.svg',
      ),
      label: 'Airplane',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/hotel.svg'),
      label: 'Hotels',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(LayoutBottomNavState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    AirplaneScreen(),
    const HotelsScreen(),
  ];
}
