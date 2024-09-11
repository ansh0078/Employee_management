import 'package:employee_management/Models/countryModel.dart';
import 'package:employee_management/controller/countryController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CountryDropdown extends StatelessWidget {
  final TextEditingController country;
  const CountryDropdown({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final CountryController countryController = Get.put(CountryController());
    return Obx(() {
      return Column(
        children: [
          DropdownButtonFormField<CountryModel>(
            validator: (value) {
              // Convert the CountryModel to a string for validation
              if (value == null || value.country == null || value.country!.isEmpty) {
                return 'Please select a country';
              }
              return null; // Return null if validation is successful
            },
            decoration: InputDecoration(
                labelText: "select Country",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            isExpanded: true,
            hint: const Text('Select Country'),
            value: countryController.selectedCountry.value,
            items: countryController.countryList.map((CountryModel country) {
              return DropdownMenuItem<CountryModel>(
                value: country,
                child: Text('${country.country}'),
              );
            }).toList(),
            onChanged: (CountryModel? newValue) {
              countryController.setSelectedCountry(newValue);
              if (newValue != null) {
                country.text = newValue.country!;
              }
            },
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }
}
