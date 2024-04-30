import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/favorites/cubit/cubit.dart';
import 'package:travel_agency_app/modules/favorites/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FavoritesCubit cubit = FavoritesCubit.get(context);
    cubit.isAirplane = true;

    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            title: const Text('Favorites'),
          ),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: cardColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                cubit.changeAirPlaneInfo(true);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Airplane',
                                    style: TextStyle(
                                      color: cubit.isAirplane
                                          ? defaultColor
                                          : blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/airplane.svg',
                                    color: cubit.isAirplane
                                        ? defaultColor
                                        : blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                cubit.changeAirPlaneInfo(false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hotels',
                                    style: TextStyle(
                                      color: !cubit.isAirplane
                                          ? defaultColor
                                          : blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/hotel.svg',
                                    color: !cubit.isAirplane
                                        ? defaultColor
                                        : blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    cubit.isAirplane
                        ? Container(
                            height: size.height * 0.5,
                            child: AirPlaneCard(),
                          )
                        : Container(
                            height: size.height * 0.5,
                            child: const HotelsCard(),
                          ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      cubit.isAirplane
                          ? 'Trips you may like'
                          : 'Hotels you may like',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    cubit.isAirplane
                        ? SizedBox(
                            width: double.infinity,
                            height: size.height * 0.2,
                            child: const TripsList(),
                          )
                        : OffersListView(
                            image: 'assets/images/hotel1.jpg',
                            title: 'london hotel',
                            description: 'England',
                          ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
