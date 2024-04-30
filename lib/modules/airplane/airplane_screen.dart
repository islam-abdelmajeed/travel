import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/airplane/cubit/cubit.dart';
import 'package:travel_agency_app/modules/airplane/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class AirplaneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AirplaneCubit cubit = AirplaneCubit.get(context);
    return BlocConsumer<AirplaneCubit, AirplaneStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  CustomImageBox(
                    height: size.height * 0.3,
                    width: double.infinity,
                    radius: 0.0,
                    image: 'assets/images/023.jpg',
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Text(
                          'Compare and book flight tickets',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: whiteColor,
                                  ),
                        ),
                        Text(
                          'At the best price from Fly Travel',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: whiteColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AdvantagesStyle(
                        svgIcon: 'assets/images/time.svg',
                        title: 'Your bookings are easier',
                        description:
                            'Search, compare and book your ticket at the cheapest prices',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AdvantagesStyle(
                        svgIcon: 'assets/images/safe payment.svg',
                        title: 'Secure payment',
                        description:
                            'Choose the payment method for your reservations',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AdvantagesStyle(
                        svgIcon: 'assets/images/customer service.svg',
                        title: '24/7 customer service',
                        description:
                            'We are available to serve you around the clock',
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Great family trips',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 16.0,
                                  color: blackColor,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Stack(
                        children: [
                          CustomImageBox(
                            height: size.height * 0.25,
                            width: double.infinity,
                            radius: 5.0,
                            image: 'assets/images/Famliy 1.jpg',
                          ),
                          Center(
                            child: Container(
                              color: lightGreyColor.withOpacity(0.2),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.06,
                                  ),
                                  Text(
                                    'Your family deserves it',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: defaultColor),
                                  ),
                                  Text(
                                    'Book travel tickets for your family \nand enjoy a special price',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  CustomButton(
                                    function: () {},
                                    text: 'Book Now!',
                                    width: size.width * 0.5,
                                    background: lightColor,
                                    radius: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Plan your perfect trip',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            'The most popular trips',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 16.0,
                                  color: blackColor,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.2,
                        child: const TripsList(),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Offers',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 16.0,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      OffersListView(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        color: lightGreyColor.withOpacity(0.2),
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: cubit.offerSlider.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(cubit.offerSlider[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                initialPage: 0,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 200),
                                height: size.height * 0.3,
                                autoPlay: true,
                                enlargeCenterPage: true,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Your family deserves it',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'Book travel tickets for your family \nand enjoy a special price',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  CustomButton(
                                    function: () {},
                                    text: 'Book Now!',
                                    width: size.width * 0.5,
                                    background: lightColor,
                                    radius: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
