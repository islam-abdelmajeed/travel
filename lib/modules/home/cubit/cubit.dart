import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/home/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
}
