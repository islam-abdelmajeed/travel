import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/hotel_booking_details/cubit/states.dart';

class HotelBookingDetailsCubit extends Cubit<HotelBookingDetailsStates> {
  HotelBookingDetailsCubit() : super(HotelBookingDetailsInitialState());

  static HotelBookingDetailsCubit get(context) => BlocProvider.of(context);

}
