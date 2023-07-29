// ignore_for_file: file_names

import 'package:beepy_app/ui/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _HomePageState();
}

class _HomePageState extends State<SplashPage> {
  List<Image> images = [
    Image.asset("assets/car.png"),
    Image.asset("assets/airplaneSplash.png"),
    Image.asset("assets/IceCream.png"),
    Image.asset("assets/location.png"),
  ];

  bool autoPlay = true;

  List<Column> text = const [
    Column(
      children: [
        Text(
          "Find Your Vehicle",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Find the perfect vehicle for every occasion!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
    Column(
      children: [
        Text(
          "Your dream Car",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Rent the car you’ve always wanted to drive.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
    Column(
      children: [
        Text(
          "Small Ones Too!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Rent a small vehicle for those short distances",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
    Column(
      children: [
        Text(
          "Find Our Stations",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Find your nearest station to rent your car!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Beepy",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins"),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 319,
            width: double.infinity,
            child: CarouselSlider(
              items: [
                for (int i = 0; i < images.length; i++)
                  Column(
                    children: [
                      SizedBox(
                        height: 230,
                        width: double.infinity,
                        child: images[currentIndex], // i
                      )
                    ],
                  )
              ],
              //
              options: CarouselOptions(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  autoPlayInterval: const Duration(seconds: 8),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  autoPlay: autoPlay),
            ),
            //
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < images.length; i++)
                Container(
                  height: 5,
                  width: 11.91,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: currentIndex == i
                        ? const Color(0xffFA7F35)
                        : const Color(0xffFA7F35).withOpacity(0.3),
                    shape: BoxShape.rectangle,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          text[currentIndex],
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                currentIndex++;
                setState(() {});
                if (currentIndex == 4) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                  autoPlay = false;
                  setState(() {});
                }
                currentIndex == 4 ? currentIndex = 3 : null;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFA7F35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(305, 57)),
              child: currentIndex == 3
                  ? const Text("Get Started")
                  : const Text("Continue"))
        ],
      ),
    ));
  }
}
