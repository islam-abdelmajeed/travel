import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/flight_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/flight_details/cubit/states.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class FlightDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FlightDetailsCubit cubit = FlightDetailsCubit.get(context);
    return BlocConsumer<FlightDetailsCubit, FlightDetailsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            title: const Text(
              'Flight Details',
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
                            'Cairo, Egypt - Dubai, United Arab Emirates\n (round trip)',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: blackColor),
                          ),
                          Text(
                            'class: economy',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Travelers: 1',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Date: Friday, September 8, 2023\nThursday, October 12, 2023',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                'جنية مصري',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: const Color(0xffFF8682),
                                    ),
                              ),
                              Text(
                                ' 34115.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xffFF8682),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomImageBox(
                    height: size.height * 0.15,
                    width: double.infinity,
                    radius: 10.0,
                    image: 'assets/images/Rectangle_airplane.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Return to the search menu'),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.35,
                    width: double.infinity,
                    child: AirplaneDetailsCard(),
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
