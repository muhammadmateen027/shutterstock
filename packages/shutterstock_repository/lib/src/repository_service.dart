part of 'shutterstock_repository.dart';

/// This class will handle only repository related to the api
abstract class RepositoryService {
  /// This function require image query as a string to load related images
  Future<Response> searchImages(String query, [int index = 1]);
}
