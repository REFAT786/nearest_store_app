import 'package:get/get.dart';
import 'package:nearest_store_app/controller/store_controller.dart';

import '../service/api_service.dart';
import '../service/location_service.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    /// >>>>>>>>>>>>>>>>>>>>>>>> Service >>>>>>>>>>>>>>>>>>
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => LocationService(), fenix: true);

    /// >>>>>>>>>>>>>>>>>>>>>>>> Controller >>>>>>>>>>>>>>>>>>
    Get.lazyPut(() => StoreController(), fenix: true);
  }
}