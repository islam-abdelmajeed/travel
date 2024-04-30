import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/airplane/cubit/states.dart';

class AirplaneCubit extends Cubit<AirplaneStates> {
  AirplaneCubit() : super(AirplaneInitialState());

  static AirplaneCubit get(context) => BlocProvider.of(context);

  List<String> offerSlider = [
    'assets/images/London2.jpg',
    'assets/images/London3.jpg',
    'assets/images/Londons1.jpg',
  ];
}
