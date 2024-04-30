import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/drawer/drawer_screen.dart';
import 'package:travel_agency_app/layout/cubit/cubit.dart';
import 'package:travel_agency_app/layout/cubit/states.dart';
import 'package:travel_agency_app/modules/search/airline_search_screen.dart';
import 'package:travel_agency_app/modules/search/hotels_search_screen.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            centerTitle: false,
            title: Row(
              children: [
                cubit.currentIndex == 0
                    ? SizedBox()
                    : MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cubit.currentIndex == 1
                                    ? AirlineSearchScreen()
                                    : HotelsSearchScreen()),
                          );
                        },
                        elevation: 0.0,
                        color: lightColor,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: whiteColor,
                            ),
                            Text(
                              'Search',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: whiteColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                const Spacer(),
                const Text(
                  'Fly Travel',
                ),
              ],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          drawer: const DrawerScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
