import 'package:beepy_app/cubit/book_car_state.dart';
import 'package:beepy_app/model/beepModel.dart';
import 'package:beepy_app/model/bookedCarModel.dart';
import 'package:beepy_app/service/beepService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCarCubit extends Cubit<BookCarState> {
  BookCarCubit() : super(const BookCarInitialState());

  //logics
  final BeepService _service = BeepService();

  Future<void> getBookCar(BigCar car) async {
    emit(const BookCarLoadingState());
    dynamic response = await _service.postBookCar(car);
    if (response is BookedCarStatusModel) {
      emit(BookCarCompleteState(response));
    } else {
      emit(BookCarErrorState(response));
    }
  }
}
