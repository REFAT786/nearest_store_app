import 'dart:developer';
import 'package:get/get.dart';
import 'package:nearest_store_app/model/store_model.dart';

import '../service/api_service.dart';

class StoreRepository {
  final ApiService storeService = Get.find<ApiService>();

  var appUrl = "https://api.kfcbd.com/stores";

  Future<List<StoreModel>> fetchNearestStores() async {
    final data = await storeService.get(appUrl);

    if (data.containsKey('store') && data['store'] is List) {
      return (data['store'] as List)
          .map((json) => StoreModel.fromJson(json))
          .toList();
    } else {
      log('No "store" key in response');
      return [];
    }
  }

}