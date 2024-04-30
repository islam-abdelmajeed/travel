import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/layout/cubit/cubit.dart';
import 'package:travel_agency_app/layout/layout_screen.dart';
import 'package:travel_agency_app/modules/account/account_screen.dart';
import 'package:travel_agency_app/modules/favorites/favorites_screen.dart';
import 'package:travel_agency_app/modules/flight_booking_details/flight_booking_details_screen.dart';
import 'package:travel_agency_app/modules/flight_details/flight_details_screen.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/hotel_booking_details_screen.dart';
import 'package:travel_agency_app/modules/hotel_details/hotel_details_screen.dart';
import 'package:travel_agency_app/modules/offers/offers_screen.dart';
import 'package:travel_agency_app/modules/refund_reservation/refund_reservation_screen.dart';
import 'package:travel_agency_app/shared/components/component.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: defaultColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                CustomDrawerItem(
                  text: 'Airline',
                  widget: const ComingSoon(),
                ),
                CustomDrawerItem(
                  text: 'Hotels',
                  widget: const ComingSoon(),
                ),
                CustomDrawerItem(
                  text: 'Refund reservation',
                  widget: RefundReservationScreen(),
                ),
                CustomDrawerItem(text: 'Currency', widget: const ComingSoon()),
                CustomDrawerItem(text: 'Account', widget: AccountScreen()),
                CustomDrawerItem(text: 'Offers', widget: OffersScreen()),
                CustomDrawerItem(text: 'Favorites', widget: FavoritesScreen()),
                CustomDrawerItem(
                    text: 'Hotel Details', widget: const HotelDetailsScreen()),
                CustomDrawerItem(
                    text: 'Flight Details', widget: FlightDetailsScreen()),
                CustomDrawerItem(
                    text: 'Flight Booking Details',
                    widget: FlightBookingDetailsScreen()),
                CustomDrawerItem(
                    text: 'Hotel Booking Details',
                    widget: HotelBookingDetailsScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Coming Soon :)))'),
      ),
    );
  }
}
