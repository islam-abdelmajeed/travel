import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/home/cubit/cubit.dart';
import 'package:travel_agency_app/modules/home/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CustomImageBox(
                    height: size.height * 0.3,
                    width: double.infinity,
                    radius: 0.0,
                    image: 'assets/images/BG.jpg',
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
                          'Travel, Live and Discover',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: whiteColor,
                                  ),
                        ),
                        Text(
                          'World',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: defaultColor,
                                  ),
                        ),
                        SvgPicture.asset('assets/images/Vector 2524.svg')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best Directions',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.0,
                            color: blackColor,
                          ),
                    ),
                    SizedBox(
                      height: size.height * 0.42,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageBox(
                                  height: size.height * 0.3,
                                  width: size.width * 0.55,
                                  radius: 10.0,
                                  image: 'assets/images/Rectangle 27.jpg'),
                              const Text(
                                'Dubai',
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  SvgPicture.asset(
                                      'assets/images/location icon.svg'),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    'The United Arab Emirates',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: size.width * 0.05,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Stack(
                      children: [
                        CustomImageBox(
                          height: size.height * 0.25,
                          width: double.infinity,
                          radius: 5.0,
                          image: 'assets/images/London.jpg',
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
                                'Planning a trip to London?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: whiteColor,
                                    ),
                              ),
                              Text(
                                'Choose your vacation in London.. Book online',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: whiteColor,
                                    ),
                              ),
                              Text(
                                'Or contact a travel expert',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: whiteColor,
                                    ),
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Offers',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.0,
                            color: blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  CustomImageBox(
                                    height: size.height * 0.3,
                                    width: size.width * 0.7,
                                    radius: 15.0,
                                    isGradient: true,
                                    image: 'assets/images/Post1.jpg',
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Free insurance with every flight reservation',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: whiteColor,
                                                ),
                                          ),
                                          Text(
                                            'Travel with peace of mind with Fly Travel',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: lightGreyColor,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: whiteColor,
                                        size: 10.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: size.width * 0.05,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
