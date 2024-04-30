import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/cubit.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/states.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/hotel_traveler_data.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class HotelBookingDetailsScreen extends StatelessWidget {
  const HotelBookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HotelBookingDetailsCubit cubit = HotelBookingDetailsCubit.get(context);

    return BlocConsumer<HotelBookingDetailsCubit, HotelBookingDetailsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Hotel Booking Details',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  HotelBookingDetails(),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  HotelPriceDetails(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CustomButton(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelTravelerData(),
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
