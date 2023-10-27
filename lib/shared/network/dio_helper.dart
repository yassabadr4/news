import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  Future getData({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    return await dio.get(path, queryParameters: params);
  }
}
