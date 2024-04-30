import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/hotel_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotel_details/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HotelDetailsCubit cubit = HotelDetailsCubit.get(context);
    return BlocConsumer<HotelDetailsCubit, HotelDetailsStates>(
      listener: (BuildContext context, HotelDetailsStates state) {},
      builder: (BuildContext context, HotelDetailsStates state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            title: const Text(
              'Hotel Details',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hyatt Place Dubai Baniyas Square',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Star.svg',
                              ),
                              SvgPicture.asset(
                                'assets/images/Star.svg',
                              ),
                              SvgPicture.asset(
                                'assets/images/Star.svg',
                              ),
                              SvgPicture.asset(
                                'assets/images/Star.svg',
                              ),
                              SvgPicture.asset(
                                'assets/images/Star.svg',
                              ),
                              Text(
                                'Hotel five star',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                              ),
                              Text(
                                'Hotel five star',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '250\$',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(0xffFF8682),
                                ),
                          ),
                          Text(
                            '/night',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: const Color(0xffFF8682),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      CustomButton(
                        function: () {},
                        text: 'Book now',
                      ),
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.share,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CarouselSlider.builder(
                    itemCount: cubit.bestHotelsSlider.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(cubit.bestHotelsSlider[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      initialPage: 0,
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      height: size.height * 0.3,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CustomDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: blackColor,
                            ),
                      ),
                      ExpandableText(
                        'Hyatt Place Dubai Baniyas Square is one of the best 4-star hotels in Dubai, and simply visiting this hotel is considered a complete vacation due to its wonderful atmosphere in this city. The hotel also has a unique location, which makes it the ideal choice for leisure and business tourism. Both are a building in a luxurious architectural style. Hyatt Place Dubai Baniyas Square is located in Nasser Square, the heart of the old city. The hotel is conveniently located minutes from Dubai International Airport, and a few steps from the Green Line metro station and bus stations, making the hotel one of the best hotels in Dubai and Baniyas hotels alike. Dubai is a city and emirate in the United Arab Emirates, famous for its luxury shopping, modern architecture, and vibrant night scene. Dubai has emerged as a global city and a business center in the Middle East. Dubai is also distinguished by being one of the most famous tourist destinations in the world and one of the most important tourist attractions that you can visit during... Your stay includes visiting Burj Khalifa, which is about 12.6 km away, and visiting the Dubai Fountain, which is about 13.0 km away. The hotel includes 125 spacious guest rooms, and is distinguished from other hotels by providing high-quality amenities in order to make your visit as comfortable and enjoyable as possible. All of our guest rooms have been uniquely designed and equipped with the latest entertainment and comfort facilities to meet all the needs of today for both business travelers and those looking for... For entertainment alike, the rooms feature contemporary designs with elegant décor that blends contemporary design infused with authentic Arabic touches that include natural wood finishes and glass with beautiful engravings. The rooms include a wide range of amenities equipped with care and beauty to satisfy the most demanding guests. They are equipped with a flat screen TV, amenities, Good ventilation, a comfortable sofa, and bathrooms with the most exquisite designs for an unparalleled experience. Enjoy a delicious and fresh breakfast, a business desk, an iron/ironing board, a tea/coffee maker, and high-speed Internet service to ensure your comfort, which makes your stay special. There are a group of distinctive activities, including: a golf course in order to enjoy spending leisure time during your stay there. You can enjoy the comfortable atmosphere provided by the facility through a group of recreational activities, including: a gym, which is equipped with the latest equipment in order to restore vitality and activity, and an outdoor swimming pool to help you regain your energy after a long day of activity and touring in the city. The hotel also offers many services to all guests during their stay in the facility to maintain more comfort for guests, including: daily cleaning service, currency exchange, facilities for people with special needs, elevator, safety deposit box, meeting room, and a 24-hour reception desk. Gallery Café, which offers delicious food or refreshing drinks prepared from fresh ingredients. All of these delicious delicacies can be ordered from Free Gallery Kitchen Breakfast, Gallery Menu and Market, one of the best restaurants in Dubai. Gallery Souq, which offers delicious ready-made meals that you can take with you, starting with snacks. And sandwiches to pastries and sweets. The coffee and cocktail bar is the ideal place to meet with friends and colleagues and enjoy our specialty coffee and various tea options in the morning before working hours. Save a lot of time and money and book Hyatt Place Dubai Baniyas Square at the best prices with Fly Travel.',
                      ),
                      CustomDivider(),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    children: [
                      CustomImageBox(
                          height: size.height * 0.1,
                          width: size.width * 0.2,
                          radius: 5.0,
                          image: 'assets/images/London3.jpg'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Column(
                        children: [
                          Text(
                            'Special room - double room - 2 beds',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          Row(
                            children: [
                              Text(
                                '250\$',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                '/night',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              CustomButton(
                                function: () {},
                                text: 'Book now',
                              ),
                            ],
                          ),
                          CustomDivider(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      CustomImageBox(
                          height: size.height * 0.1,
                          width: size.width * 0.2,
                          radius: 5.0,
                          image: 'assets/images/London3.jpg'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Column(
                        children: [
                          Text(
                            'Special room - double room - 2 beds',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          Row(
                            children: [
                              Text(
                                '250\$',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                '/night',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              CustomButton(
                                function: () {},
                                text: 'Book now',
                              ),
                            ],
                          ),
                          CustomDivider(),
                        ],
                      ),
                    ],
                  ),
                  CustomDivider(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: blackColor,
                                    ),
                          ),
                          const Spacer(),
                          CustomButton(
                            function: () {},
                            text: 'Open on Google Maps',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomImageBox(
                        height: size.height * 0.2,
                        width: double.infinity,
                        radius: 15.0,
                        image: 'assets/images/Rectangle 19.png',
                      ),
                      CustomDivider(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Advantages',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: blackColor,
                            ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/material-symbols_spa-rounded.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Breakfast.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/mdi_pool.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/maki_fitness-centre.svg',
                              ),
                              Text(
                                'Fitness Center',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_round-restaurant.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/material-symbols_room-service-rounded.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Wifi.svg',
                              ),
                              Text(
                                'Tea/coffee making machine',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
