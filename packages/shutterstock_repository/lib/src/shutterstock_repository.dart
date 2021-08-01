import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network/network.dart';

part 'repository_service.dart';

/// A sub class of the Music Service
class ShutterStockRepository implements RepositoryService {
  /// Constructor will require the client
  const ShutterStockRepository({required this.client});

  /// Network client will be required to communicate with the api
  final NetworkClient client;

  /// This function will be use to search images according to query
  @override
  Future<Response> searchImages(String query, [int page = 1]) async {
    var queryParameters = <String, String>{
      'query': query,
      'page': '$page'
    };

    var url = '${dotenv.env['API_URL']!}/images/search';
    return await client.get(
      url,
      dotenv.env['API_URL']!,
      queryParameters: queryParameters,
    );
  }
}
