import 'package:beepy_app/core/constants/sizes.dart';
import 'package:beepy_app/cubit/book_car_cubit.dart';
import 'package:beepy_app/cubit/book_car_state.dart';
import 'package:beepy_app/model/beepModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScooterInfoPage extends StatelessWidget {
  final BigCar info;
  const ScooterInfoPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          info.title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
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
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 375,
            height: 288.33,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(info.img))),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: Sizes(context).height * 0.4745,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(40)),
              color: Color(info.color),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        info.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 39,
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star_border,
                            size: 33.51,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${info.price}/day",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Wanna ride the coolest sport car in the world?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocConsumer<BookCarCubit, BookCarState>(
                      listener: ((context, state) {
                        if (state is BookCarCompleteState) {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    content: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SizedBox(
                                        height: 400,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name  :  ${state.model.car!.title}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Price : ${state.model.car!.price}/day",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Image.network(state.model.car!.img
                                                .toString()),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Center(
                                              child: Text(
                                                "Successfully Booked Now",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Expanded(
                                              child: Center(
                                                  child: Icon(
                                                Icons.check,
                                                size: 100,
                                                color: Colors.green,
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )));
                          Future.delayed(const Duration(seconds: 5), () {
                            Navigator.pop(context);
                          });
                        } else if (state is BookCarErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)));
                        }
                      }),
                      builder: (context, state) => state is BookCarLoadingState
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                context.read<BookCarCubit>().getBookCar(info);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(double.infinity, 57)),
                              child: const Center(
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
