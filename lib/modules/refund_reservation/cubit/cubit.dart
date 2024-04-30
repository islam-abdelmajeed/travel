import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/refund_reservation/cubit/states.dart';

class RefundReservationCubit extends Cubit<RefundReservationStates> {
  RefundReservationCubit() : super(RefundReservationInitialState());

  static RefundReservationCubit get(context) => BlocProvider.of(context);

 
}
