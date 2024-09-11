import 'package:employee_management/controller/userController.dart';
import 'package:employee_management/widgets/dropDownBtn.dart';
import 'package:employee_management/widgets/primaryBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add User'),
      ),
      body: Obx(
        () => userController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        resuableTextField(
                          userController.nameController,
                          'Name',
                          TextInputType.text,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        resuableTextField(
                          userController.emailController,
                          'Email',
                          TextInputType.emailAddress,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        resuableTextField(
                          userController.mobileController,
                          'Mobile',
                          TextInputType.number,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "Mobile is required";
                            } else if (value.length < 10) {
                              return "Mobile number must be atleast 10 digits long";
                            }
                            return null;
                          },
                        ),
                        CountryDropdown(country: userController.countryController),
                        resuableTextField(
                          userController.stateController,
                          'State',
                          TextInputType.text,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "State is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        resuableTextField(
                          userController.districtController,
                          'District',
                          TextInputType.text,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "District is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        resuableTextField(
                          userController.avatarController,
                          'Avatar URL',
                          TextInputType.url,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "URL is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryBtn(
                              btnName: "Submit",
                              ontap: () {
                                if(_formKey.currentState!.validate()){
                                  userController.addUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

Widget resuableTextField(
  TextEditingController controller,
  String labelText,
  TextInputType keyboardType,
  String? Function(String?) validation,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validation,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
      ),
    ),
  );
}
