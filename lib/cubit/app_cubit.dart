import 'package:bloc/bloc.dart';
import 'package:travel_app/services/api_services.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({ required this.data }) : super(InitialStates()){
    emit(WelcomeState());
  }

  final ApiServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch(e) {

    }
  }
}