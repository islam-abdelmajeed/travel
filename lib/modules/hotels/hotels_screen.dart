import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/hotels/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotels/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HotelsCubit cubit = HotelsCubit.get(context);
    return BlocConsumer<HotelsCubit, HotelsStates>(
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
                    image: 'assets/images/0.jpg',
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
                          'Get the best hotel deals',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: whiteColor,
                                  ),
                        ),
                        Text(
                          'More than 600,000 hotels',
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
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Featured hotels',
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
                        height: size.height * 0.25,
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                CustomImageBox(
                                  height: size.height * 0.25,
                                  width: size.width * 0.5,
                                  radius: 5.0,
                                  image: 'assets/images/London4.jpg',
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Hilton Garden Inn Dubai',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: whiteColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                      Text(
                                        'Al Muraqqabat, Dubai',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: whiteColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: size.width * 0.03,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        color: lightGreyColor.withOpacity(0.2),
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: cubit.bestHotelsSlider.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          cubit.bestHotelsSlider[index]),
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
                                    'The best hotels in London',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'Choose your vacation in London. \nBook online or contact one of our travel experts',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  CustomButton(
                                    function: () {},
                                    text: 'Book now!',
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
                      Row(
                        children: [
                          Text(
                            'Famous hotels',
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
                      OffersListView(
                        image: 'assets/images/hotel1.jpg',
                        title: 'london hotel',
                        description: 'England',
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
