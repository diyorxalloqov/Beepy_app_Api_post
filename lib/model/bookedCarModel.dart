class BookedCarStatusModel {
  String? msg;
  Car? car;

  BookedCarStatusModel({this.msg, this.car});

  BookedCarStatusModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (car != null) {
      data['car'] = car!.toJson();
    }
    return data;
  }
}

class Car {
  String? title;
  String? price;
  String? img;
  int? color;

  Car({this.title, this.price, this.img, this.color});

  Car.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    img = json['img'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['img'] = img;
    data['color'] = color;
    return data;
  }
}
