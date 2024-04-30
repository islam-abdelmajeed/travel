import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/states.dart';
import 'package:travel_agency_app/modules/flight_booking_details/traveler_data.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class FlightBookingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FlightBookingDetailsCubit cubit = FlightBookingDetailsCubit.get(context);
    return BlocConsumer<FlightBookingDetailsCubit, FlightBookingDetailsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flight Booking Details',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  AirplaneBookingDetails(),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AirplaneBookingDetails(),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AirplanePriceDetails(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CustomButton(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelerData(),
                        ),
                      );
                    },
                    width: double.infinity,
                    text: 'Continue',
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
