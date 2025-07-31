import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearest_store_app/dependency/dependency_injection.dart';
import 'package:nearest_store_app/route/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialized();
  runApp(const MyApp());
}

Future<void> initialized() async {
  DependencyInjection di = DependencyInjection();
  di.dependencies();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nearest store find app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: AppRoutes.nearestStoresScreen,
      getPages: AppRoutes.routes,
    );
  }
}
