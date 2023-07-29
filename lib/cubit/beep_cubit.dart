part of 'beep_state.dart';

class BeepCubit extends Cubit<BeepState> {
  BeepCubit() : super(const BeepInitialState()) {
    getCars();
  }

  final BeepService _beepService = BeepService();

  // Har bitta Page uchun alohida cubit qilgan yaxshi figmadagi har bir sahifa uchun

  Future<void> getCars() async {
    emit(const BeepLoadingState());
    dynamic response = await _beepService.getData();
    if (response is BeepModel) {
      emit(BeepCompleteState(response));
    } else {
      emit(BeepErrorState(response));
    }
  }
}



