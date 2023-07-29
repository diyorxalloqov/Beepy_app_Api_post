// To parse this JSON data, do
//
//     final beepModel = beepModelFromJson(jsonString);

import 'dart:convert';

class BeepModel {
    final List<SplashImage> splashImage;
    final List<HomeImage> homeImage;
    final List<BigCar> cars;
    final List<BigCar> bigCars;
    final List<BigCar> bikes;
    final List<BigCar> rVs;
    final List<BigCar> scooters;

    BeepModel({
        required this.splashImage,
        required this.homeImage,
        required this.cars,
        required this.bigCars,
        required this.bikes,
        required this.rVs,
        required this.scooters,
    });

    factory BeepModel.fromRawJson(String str) => BeepModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BeepModel.fromJson(Map<String, dynamic> json) => BeepModel(
        splashImage: List<SplashImage>.from(json["splashImage"].map((x) => SplashImage.fromJson(x))),
        homeImage: List<HomeImage>.from(json["HomeImage"].map((x) => HomeImage.fromJson(x))),
        cars: List<BigCar>.from(json["cars"].map((x) => BigCar.fromJson(x))),
        bigCars: List<BigCar>.from(json["bigCars"].map((x) => BigCar.fromJson(x))),
        bikes: List<BigCar>.from(json["bikes"].map((x) => BigCar.fromJson(x))),
        rVs: List<BigCar>.from(json["rVs"].map((x) => BigCar.fromJson(x))),
        scooters: List<BigCar>.from(json["scooters"].map((x) => BigCar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "splashImage": List<dynamic>.from(splashImage.map((x) => x.toJson())),
        "HomeImage": List<dynamic>.from(homeImage.map((x) => x.toJson())),
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
        "bigCars": List<dynamic>.from(bigCars.map((x) => x.toJson())),
        "bikes": List<dynamic>.from(bikes.map((x) => x.toJson())),
        "rVs": List<dynamic>.from(rVs.map((x) => x.toJson())),
        "scooters": List<dynamic>.from(scooters.map((x) => x.toJson())),
    };
}

class BigCar {
    final String title;
    final String price;
    final String img;
    final int color;

    BigCar({
        required this.title,
        required this.price,
        required this.img,
        required this.color,
    });

    factory BigCar.fromRawJson(String str) => BigCar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BigCar.fromJson(Map<String, dynamic> json) => BigCar(
        title: json["title"],
        price: json["price"],
        img: json["img"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "img": img,
        "color": color,
    };
}

class HomeImage {
    final String title;
    final String img;

    HomeImage({
        required this.title,
        required this.img,
    });

    factory HomeImage.fromRawJson(String str) => HomeImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HomeImage.fromJson(Map<String, dynamic> json) => HomeImage(
        title: json["title"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "img": img,
    };
}

class SplashImage {
    final String img;

    SplashImage({
        required this.img,
    });

    factory SplashImage.fromRawJson(String str) => SplashImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SplashImage.fromJson(Map<String, dynamic> json) => SplashImage(
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
    };
}
