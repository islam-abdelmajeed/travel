import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/favorites/cubit/states.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  bool isAirplane = false;

  void changeAirPlaneInfo(bool isAirplaneTicket) {
    isAirplane = isAirplaneTicket;
    print(isAirplane);
    emit(AccountChangeInfoState());
  }
}
