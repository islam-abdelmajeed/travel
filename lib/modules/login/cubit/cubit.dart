import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
}
