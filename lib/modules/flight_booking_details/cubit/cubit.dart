import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/flight_booking_details/cubit/states.dart';

class FlightBookingDetailsCubit extends Cubit<FlightBookingDetailsStates> {
  FlightBookingDetailsCubit() : super(FlightBookingDetailsInitialState());

  static FlightBookingDetailsCubit get(context) => BlocProvider.of(context);
}
