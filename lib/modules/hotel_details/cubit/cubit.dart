import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/hotel_details/cubit/states.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsStates> {
  HotelDetailsCubit() : super(HotelDetailsInitialState());

  static HotelDetailsCubit get(context) => BlocProvider.of(context);

  List<String> bestHotelsSlider = [
    'assets/images/London4.jpg',
    'assets/images/London33.jpg',
    'assets/images/Londons1.jpg',
  ];
}
