// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:beepy_app/cubit/beep_state.dart';
import 'package:beepy_app/ui/categories/BigCars.dart';
import 'package:beepy_app/ui/categories/Bikes.dart';
import 'package:beepy_app/ui/categories/Cars.dart';
import 'package:beepy_app/ui/categories/RVs.dart';
import 'package:beepy_app/ui/categories/Scooters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final random = Random();
    final color = Color.fromARGB(
      230,
      random.nextInt(100),
      random.nextInt(100),
      random.nextInt(200),
    );
    return BlocBuilder<BeepCubit, BeepState>(
      builder: ((context, state) => _scaffold(state, _currentIndex, color)),
    );
  }

  Scaffold _scaffold(BeepState state, int _currentIndex, Color color) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Beepy",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Image.network(
                "https://s3-alpha-sig.figma.com/img/055b/f7ca/32ff8331f701c0f787b188418816907a?Expires=1691366400&Signature=I5DIE13XM2EPAL1O5KtU~rDdxu8TPsydmxQoaq8tMmnjiGPTXb0jiaxtt45RPtib3jFaEwqjktcVcu8bVCucDybyKgx3afUIYAOYhiB~uXf33Nb-3pYy2U22dES-v9UOssBgAMJiqzLq7KjtuD6PKS4DOfEpw2N1-MyTOnA5zLlt821b3iUQsJ36EGh1kMWz3oXn0YDEzRGbCRWc8UFkQn96zfpPuDZT34YXpw9m4DU1u-2ujpZ9LIRskJ2AtNnQK3MrZ6FZxUXGzN7JIOc3OdFz3Uklstel~aWzGcLLvRlIIYiNozHJgHeoHNjU2-uoDDMtomLAFnfCImp5emwemg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                width: 35),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          if (state is BeepLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is BeepErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is BeepCompleteState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _currentIndex = index;
                    // logic bilan indexga bosilganda aynan shu pagega otishi kerak
                    if (_currentIndex == 0) {
                      navigate(const Cars(), context);
                    } else if (_currentIndex == 1) {
                      navigate(const BigCars(), context);
                    } else if (_currentIndex == 2) {
                      navigate(const Bikes(), context);
                    } else if (_currentIndex == 3) {
                      navigate(const RVs(), context);
                    } else if (_currentIndex == 4) {
                      navigate(const Scooters(), context);
                    }
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 306,
                            height: 143.5,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.data.homeImage[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          right: 50,
                          child: Image.network(
                            state.data.homeImage[index].img,
                            width: 200,
                          ))
                    ],
                  ),
                );
              },
              itemCount: state.data.homeImage.length,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void navigate(dynamic page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
