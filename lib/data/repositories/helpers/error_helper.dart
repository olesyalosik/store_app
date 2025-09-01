import 'package:dio/dio.dart';

String exceptionMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return 'Connection error';
    case DioExceptionType.cancel:
      return 'Request was cancelled';
    case DioExceptionType.badResponse:
      return 'Unexpected response';
    default:
      return 'Unexpected error';
  }
}
