import 'dart:convert';

import 'package:employee_management/Models/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;

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
}
