
import 'package:dio/dio.dart';
import 'package:fitbasix/utils/constants.dart';
import 'package:fitbasix/utils/helpers/api/result.dart';

late Dio _dio;

class APIProvider {
  APIProvider() {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = APIConstants.baseURL;
    dioOptions.responseType = ResponseType.plain;
    dioOptions.connectTimeout = const Duration(milliseconds: 200000);
    dioOptions.receiveTimeout = const Duration(milliseconds: 200000);

    dioOptions.headers = {
     'X-RapidAPI-Host': APIConstants.apiHost,
      'X-RapidAPI-Key': APIConstants.secretKey
    };

    _dio = Dio(dioOptions);
  }

  Future<Result> getAPICall({required String url}) async {
    try {
      var response = await _dio.get(url);
      return Result(data: response.data);
    } on DioError catch (e) {
      return Result(exception: e);
    } catch (e) {
      return Result(exception: e as Exception);
    }
  }

  String fromDioError(DioExceptionType dioError) {
    String message;
    switch (dioError) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.unknown:
        message =
            'Make sure that mobile data or Wi-Fi is turn on, then try again';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
    return message;
  }
}
