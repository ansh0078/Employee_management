import 'dart:convert';

import 'package:employee_management/Models/userModel.dart';
import 'package:employee_management/config/customNotification.dart';
import 'package:employee_management/pages/addPage.dart';
import 'package:employee_management/pages/homePage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserController extends GetxController {
  var userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var countryController = TextEditingController();
  var stateController = TextEditingController();
  var districtController = TextEditingController();
  var avatarController = TextEditingController();

  Future<void> addUser() async {
    try {
      isLoading.value = true;
      UserModel newUser = UserModel(
        createdAt: DateTime.now().toIso8601String(),
        name: nameController.text,
        avatar: avatarController.text,
        emailId: emailController.text,
        mobile: mobileController.text,
        country: countryController.text,
        state: stateController.text,
        district: districtController.text,
      );

      final response = await http.post(
        Uri.parse('https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee'),
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (response.statusCode == 201) {
        successMessage("Successful created account");
        Get.to(const Homepage());
      } else {
        errorMessage("unable to create a acoount");
        Get.to(const AddPage());
      }
    } catch (e) {
      errorMessage("error $e");
    } finally {
      isLoading.value = false;
      getUserDetails();
    }
  }

  Future<void> getUserDetails() async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse("https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        userList.clear();
        for (var i in data) {
          userList.add(UserModel.fromJson(i));
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
  }

  List<UserModel> get filteredUserList {
    if (searchQuery.isEmpty) {
      return userList;
    } else {
      return userList
          .where(
            (user) => user.id!.contains(searchQuery.value),
          )
          .toList();
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee/$id'),
      );
      if (response.statusCode == 200) {
        successMessage("User deleted successfully");
        getUserDetails();
      } else {
        errorMessage("Failed to delete the user");
      }
    } catch (e) {
      errorMessage("An error occurred while deleting the user");
    }
  }
}
