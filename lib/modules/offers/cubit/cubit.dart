import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/offers/cubit/states.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersInitialState());

  static OffersCubit get(context) => BlocProvider.of(context);
}
