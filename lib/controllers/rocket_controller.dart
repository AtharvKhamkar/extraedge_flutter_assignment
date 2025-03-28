import 'package:extraedge_spacex/models/rocket_model.dart';
import 'package:extraedge_spacex/repository/rocket_repository.dart';
import 'package:extraedge_spacex/services/database_service.dart';
import 'package:extraedge_spacex/services/error_handler_service.dart';
import 'package:extraedge_spacex/services/sql_functions_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RocketController extends GetxController {
  final RocketRepository rocketRepository = RocketRepository();
  final SqlFunctionsService sqlFunctionsService = SqlFunctionsService();
  final DatabaseService databaseService = DatabaseService();

  //Rx Variables
  List<RocketModel> rockets = <RocketModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    fetchRockets();
    super.onInit();
  }

  Future<void> fetchRockets() async {
    try {
      isLoading(true);
      errorMessage('');

      // Initialize database table
      await databaseService.processRockets();

      // check if the data exists in the local database
      final cachedRockets = await sqlFunctionsService.getRockets();
      if (cachedRockets.isNotEmpty) {
        debugPrint('Fetched results from the cached table');
        rockets.assignAll(cachedRockets);
        return;
      }

      // Request for rockets to backend
      final fetchedRockets = await rocketRepository.getRockets();
      if (fetchedRockets.isNotEmpty) {
        debugPrint('Fetched results from the api request');
        rockets.addAll(fetchedRockets);

        // Cache rockets in database
        for (RocketModel rocket in rockets) {
          debugPrint('Inserting rocket into the table ${rocket.name}');
          await sqlFunctionsService.insertRocket(rocket);
        }
      }
    } catch (e, stackTrace) {
      ErrorHandlerService.handleError(e, 'RocketController.fetchRockets',
          stackTrace: stackTrace);
    } finally {
      isLoading(false);
    }
  }
}

class RocketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RocketBinding>(
      () => RocketBinding(),
      fenix: true,
    );
  }
}
