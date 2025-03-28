import 'package:dio/dio.dart';
import 'package:extraedge_spacex/models/rocket_model.dart';
import 'package:extraedge_spacex/services/error_handler_service.dart';

class RocketRepository {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<List<RocketModel>> getRockets() async {
    try {
      final response = await dio.get('$baseUrl/rockets');
      return (response.data as List)
          .map((json) => RocketModel.fromJson(json))
          .toList();
    } catch (e, stackTrace) {
      ErrorHandlerService.handleError(e, 'RocketRepository.fetchRockets',
          stackTrace: stackTrace);
      throw Exception('Failed to fetch rockets: $e');
    }
  }

  Future<RocketModel> getRocketsDetails(String id) async {
    try {
      final response = await dio.get('$baseUrl/rockets/$id');
      return RocketModel.fromJson(response.data);
    } catch (e, stackTrace) {
      ErrorHandlerService.handleError(e, 'RocketRepository.fetchRockets',
          stackTrace: stackTrace);
      throw Exception('Failed to fetch rockets: $e');
    }
  }
}
