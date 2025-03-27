import 'package:extraedge_spacex/models/rocket_model.dart';
import 'package:extraedge_spacex/services/database_service.dart';

class SqlFunctionsService {
  final DatabaseService databaseService = DatabaseService();

  Future<void> createRocketsTable() async {
    await databaseService.createTable('rockets', RocketModel.rocketTableSchema);
  }

  Future<void> insertRocket(RocketModel rocket) async {
    await databaseService.insert('rockets', rocket.toMap());
  }

  Future<List<RocketModel>> getRockets() async {
    final maps = await databaseService.displayTable('rockets');
    return maps.map((map) => RocketModel.fromMap(map)).toList();
  }
}
