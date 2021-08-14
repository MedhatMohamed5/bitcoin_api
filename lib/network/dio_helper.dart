import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  DioHelper._();

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coindesk.com/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url}) async {
    return await _dio.get(url);
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
