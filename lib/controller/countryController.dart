import 'dart:convert';

import 'package:employee_management/Models/countryModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CountryController extends GetxController {
  var countryList = <CountryModel>[].obs;
  var selectedCountry = Rxn<CountryModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse('https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/country'),
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        countryList.value = jsonData.map((country) => CountryModel.fromJson(country)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch countries");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  // Set selected country
  void setSelectedCountry(CountryModel? country) {
    selectedCountry.value = country;
  }
}
