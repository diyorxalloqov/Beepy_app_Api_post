import 'package:beepy_app/core/constants/api.dart';
import 'package:beepy_app/model/beepModel.dart';
import 'package:beepy_app/model/bookedCarModel.dart';
import 'package:dio/dio.dart';

class BeepService {
  Future<dynamic> getData() async {
    try {
      Response response = await Dio().get(Api.apiGet);
      if (response.statusCode == 200) {
        return BeepModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> postBookCar(BigCar car) async {
    try {
      Response response = await Dio().post(Api.apiPost, data: {
        "title": car.title,
        "price": car.price,
        "img": car.img,
        "color": car.color
      });
      if (response.statusCode == 201) {
        return BookedCarStatusModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
