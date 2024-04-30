import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/hotels/cubit/states.dart';

class HotelsCubit extends Cubit<HotelsStates> {
  HotelsCubit() : super(HotelsInitialState());

  static HotelsCubit get(context) => BlocProvider.of(context);

  List<String> bestHotelsSlider = [
    'assets/images/London4.jpg',
    'assets/images/London33.jpg',
    'assets/images/Londons1.jpg',
  ];
}
