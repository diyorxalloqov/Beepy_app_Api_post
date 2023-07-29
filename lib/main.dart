import 'package:beepy_app/cubit/beep_state.dart';
import 'package:beepy_app/cubit/book_car_cubit.dart';
import 'package:beepy_app/ui/pages/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => BeepCubit()),
    BlocProvider(create: (context) => BookCarCubit()),
  ], child: const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashPage(),
    );
  }
}
