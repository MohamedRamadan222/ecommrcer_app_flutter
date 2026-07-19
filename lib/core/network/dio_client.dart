import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/storage/user_storage.dart';

class ApiClient {
  // Private constructor to prevent instantiation
  ApiClient._();

  // Define your base API constants
  static const String baseUrl = 'https://dummyjson.com';
  static const Duration connectTimeout = Duration(seconds: 5);
  static const Duration receiveTimeout = Duration(seconds: 3);

  // The global, reusable Dio instance
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            headers: const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: ((options, handler) {
              final token = UserStorage.getToken();
              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';
              }
              return handler.next(options);
            }),
          ),
        );
}
