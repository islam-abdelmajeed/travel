import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/forget%20password/cubit/states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
}
