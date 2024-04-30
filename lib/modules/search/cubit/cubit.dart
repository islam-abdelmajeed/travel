import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_agency_app/modules/search/cubit/states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  int? selectedOption;

  void changeOptions(value) {
    print('Value = $value');
   
    selectedOption = value;
    emit(SearchRadioChangeState());
  }
}
