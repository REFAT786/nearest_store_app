import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService{

  Future<Map<String, dynamic>> get(String endpoint, {String? token}) async {
    final url = Uri.parse(endpoint);
    try {
      final response = await http.get(
        url,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          if (token != null) 'Authorization': token,
          if (token != null) 'token': 'Bearer $token',
          if (token != null) 'token': token,
          'Content-Type': 'application/json',
        },
      );

      log('GET $url → ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e, s) {
      log('Error during GET request: $e\n$s');
      throw Exception('GET request failed: $e');
    }
  }



}
