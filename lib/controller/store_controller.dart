import 'dart:developer';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../model/store_model.dart';
import '../repository/store_repository.dart';
import '../service/location_service.dart';

class StoreController extends GetxController {
  final StoreRepository repository = StoreRepository();
  final LocationService locationService = Get.find<LocationService>();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<StoreModel> nearestStores = <StoreModel>[].obs;
  Position? currentPosition;

  @override
  void onInit() {
    super.onInit();
    fetchNearestStores();
  }

  Future<void> fetchNearestStores() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      // Get current location
      currentPosition = await locationService.getCurrentLocation();
      log('Current location: ${currentPosition!.latitude}, ${currentPosition!.longitude}');

      // Fetch stores from API
      final stores = await repository.fetchNearestStores();
      log('Fetched ${stores.length} stores from API');

      if (stores.isEmpty) {
        errorMessage.value = 'No stores found in the API response';
        hasError.value = true;
        return;
      }

      // Calculate distances and add to each store
      for (var store in stores) {
        final distance = locationService.calculateDistance(
          currentPosition!.latitude,
          currentPosition!.longitude,
          store.lat,
          store.lng,
        );
        store.distance = distance;
        log('${store.name}: ${(distance / 1000).toStringAsFixed(2)} km away');
      }

      // Sort by distance and take the nearest 2
      stores.sort((a, b) => a.distance.compareTo(b.distance));
      nearestStores.assignAll(stores.take(2));

      log('Nearest stores: ${nearestStores.map((s) => '${s.name} (${(s.distance / 1000).toStringAsFixed(2)} km)').join(', ')}');

    } catch (e, s) {
      log('Error fetching nearest stores: $e\n$s');
      hasError.value = true;

      if (e.toString().contains('Location services are disabled')) {
        errorMessage.value = 'Location services are disabled. Please enable location services and try again.';
      } else if (e.toString().contains('Location permissions')) {
        errorMessage.value = 'Location permission denied. Please grant location permission and try again.';
      } else if (e.toString().contains('Failed to fetch data')) {
        errorMessage.value = 'Failed to load store data. Please check your internet connection and try again.';
      } else {
        errorMessage.value = 'An unexpected error occurred. Please try again.';
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Method to refresh the data
  Future<void> refreshStores() async {
    await fetchNearestStores();
  }
}