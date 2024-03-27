
import 'package:dio/dio.dart';
import 'end_points.dart';

class ApiManager{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.BASEURL,
      contentType: 'application/json',
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "contentType": "application/json",
        "accept": "application/json",
      },
    ),
  );

}