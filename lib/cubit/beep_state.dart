// ignore_for_file: must_be_immutable

import 'package:beepy_app/model/beepModel.dart';
import 'package:beepy_app/service/beepService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'beep_cubit.dart';
// Har bitta Page uchun alohida cubit qilgan yaxshi figmadagi har bir sahifa uchun

abstract class BeepState extends Equatable {
  const BeepState();

  @override
  List<Object?> get props => [];
}

class BeepInitialState extends BeepState {
  const BeepInitialState();

  @override
  List<Object?> get props => [];
}

class BeepLoadingState extends BeepState {
  const BeepLoadingState();

  @override
  List<Object?> get props => [];
}

class BeepErrorState extends BeepState {
  final String error;
  const BeepErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class BeepCompleteState extends BeepState {
  final BeepModel data;
  const BeepCompleteState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
