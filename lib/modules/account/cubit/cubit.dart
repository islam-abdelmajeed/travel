import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/account/cubit/states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitialState());

  static AccountCubit get(context) => BlocProvider.of(context);

  bool isAccount = false;
  bool isAirplane = false;

  void changeAccountInfo(bool isAccountInfo) {
    isAccount = isAccountInfo;

    emit(AccountChangeInfoState());
  }

  void changeAirPlaneInfo(bool isAirplaneTicket) {
    isAirplane = isAirplaneTicket;

    emit(AccountChangeInfoState());
  }
}
