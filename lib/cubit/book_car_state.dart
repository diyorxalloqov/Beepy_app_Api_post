import 'package:beepy_app/model/bookedCarModel.dart';
import 'package:equatable/equatable.dart';

abstract class BookCarState extends Equatable{
  const BookCarState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BookCarInitialState extends BookCarState{
  const BookCarInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BookCarLoadingState extends BookCarState{
  const BookCarLoadingState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BookCarErrorState extends BookCarState{
  final String error;
  const BookCarErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class BookCarCompleteState extends BookCarState{
  final BookedCarStatusModel model;
  const BookCarCompleteState(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];
}