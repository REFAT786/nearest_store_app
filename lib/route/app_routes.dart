import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screen/nearest_stores_screen.dart';

class AppRoutes {

  static const String nearestStoresScreen = "/nearest_stores_screen";

  static List<GetPage> routes = [
    GetPage(
      name: nearestStoresScreen,
      page: () =>  NearestStoresScreen(),
      transition: Transition.fade,
    )

  ];
}