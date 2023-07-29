import 'package:beepy_app/ui/categories/info/Bikes_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/beep_state.dart';

class Bikes extends StatelessWidget {
  const Bikes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeepCubit, BeepState>(
        builder: ((context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Bikes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
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
            body: Builder(builder: (context) {
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BikesInfoPage(info: state.data.bikes[index])));
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
                                    color: Color(state.data.bikes[index].color),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data.bikes[index].title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${state.data.bikes[index].price}/day",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
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
                                state.data.bikes[index].img,
                                width: 200,
                              ))
                        ],
                      ),
                    );
                  },
                  itemCount: state.data.bikes.length,
                );
              } else {
                return const SizedBox.shrink();
              }
            }))));
  }
}
