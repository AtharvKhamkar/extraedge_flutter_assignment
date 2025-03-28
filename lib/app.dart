import 'package:extraedge_spacex/controllers/rocket_controller.dart';
import 'package:extraedge_spacex/routes/app_routes.dart';
import 'package:extraedge_spacex/routes/app_routes_constants.dart';
import 'package:extraedge_spacex/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: AppTheme.customTextTheme,
        useMaterial3: true,
      ),
      initialRoute: AppRouterConstant.kHomeScreen,
      getPages: AppRoutes.routes,
      initialBinding: RocketBinding(),
    );
  }
}
