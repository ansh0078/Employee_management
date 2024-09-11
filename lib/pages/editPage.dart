import 'package:employee_management/Models/userModel.dart';
import 'package:employee_management/controller/userController.dart';
import 'package:employee_management/widgets/dropDownBtn.dart';
import 'package:employee_management/widgets/primaryBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatefulWidget {
  final String id;

  const EditPage({required this.id, super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userController.getUserDetails().then((_) {
        final user = userController.userList.firstWhere((user) => user.id == widget.id, orElse: () => UserModel());
        if (user != null) {
          userController.nameController.text = user.name ?? '';
          userController.emailController.text = user.emailId ?? '';
          userController.mobileController.text = user.mobile ?? '';
          userController.countryController.text = user.country ?? '';
          userController.stateController.text = user.state ?? '';
          userController.districtController.text = user.district ?? '';
          userController.avatarController.text = user.avatar ?? '';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit User'),
      ),
      body: Obx(() {
        return userController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      resuableTextField(userController.nameController, 'Name'),
                      resuableTextField(userController.emailController, 'Email'),
                      resuableTextField(userController.mobileController, 'Mobile'),
                      CountryDropdown(country: userController.countryController),
                      resuableTextField(userController.stateController, 'State'),
                      resuableTextField(userController.districtController, 'District'),
                      resuableTextField(userController.avatarController, 'Avatar URL'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryBtn(
                              btnName: "Update User",
                              ontap: () {
                                userController.updateUser(widget.id);
                              })
                        ],
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

Widget resuableTextField(TextEditingController controller, String labelText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
      ),
    ),
  );
}
