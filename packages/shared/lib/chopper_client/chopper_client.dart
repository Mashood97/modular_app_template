import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/constant/api_routes.dart';

import 'interceptor/internet_connection_interceptor.dart';

class ChopperClientInstance {
  factory ChopperClientInstance() {
    return _singleton;
  }

  ChopperClientInstance._internal();

  static final ChopperClientInstance _singleton =
      ChopperClientInstance._internal();

  static ChopperClient? client;

  static void initializeChopperClient() {
    client ??= ChopperClient(
      baseUrl: Uri.parse(ApiRoutes.apiBaseUrl),
      services: [
        // Create and pass an instance of the generated service to the client
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: kDebugMode
          ? [InternetConnectionInterceptor(), HttpLoggingInterceptor()]
          : [InternetConnectionInterceptor()],
    );
  }
}
