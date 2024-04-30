import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/sign%20up/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
}
