import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network/network.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

class Initialization {
  // check either it's debug or release mode
  static const bool enableLogging = !kDebugMode;

  static Future<RepositoryService> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Load environment file
    await dotenv.load(fileName: '.env');


    final _dio = Dio();
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    // enable network interceptor for logs in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptors());
    }

    return ShutterStockRepository(client: NetworkClient(dio: _dio));
  }
}
