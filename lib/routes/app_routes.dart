import 'package:extraedge_spacex/controllers/rocket_controller.dart';
import 'package:extraedge_spacex/routes/app_routes_constants.dart';
import 'package:extraedge_spacex/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = AppRouterConstant.kHomeScreen;

  static final routes = [
    GetPage(
        name: AppRouterConstant.kHomeScreen,
        page: () => HomeScreen(),
        binding: RocketBinding())
  ];
}
