import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/flight_details/cubit/states.dart';

class FlightDetailsCubit extends Cubit<FlightDetailsStates> {
  FlightDetailsCubit() : super(FlightDetailsInitialState());

  static FlightDetailsCubit get(context) => BlocProvider.of(context);

}
