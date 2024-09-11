import 'package:employee_management/controller/userController.dart';
import 'package:employee_management/pages/editPage.dart';
import 'package:employee_management/widgets/appBarAction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Detail's"),
        actions: [
          AppBarActions()
        ],
      ),
      body: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                userController.searchQuery.value = value;
              },
            ),
          ),

          // User List
          Expanded(
            child: Obx(() {
              if (userController.userList.isEmpty) {
                userController.getUserDetails();
                return const Center(child: CircularProgressIndicator());
              }
              final filteredList = userController.filteredUserList;
              if (filteredList.isEmpty) {
                return const Center(child: Text('No matching users found'));
              }
              return RefreshIndicator(
                onRefresh: () => userController.getUserDetails(),
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final user = filteredList[index];
                    return ListTile(
                      leading: Text(
                        user.id.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      title: Text(
                        user.name.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        user.emailId.toString(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(EditPage(
                                  id: user.id.toString(),
                                ));
                              },
                              icon: const Icon(Icons.edit_rounded)),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete User'),
                                  content: Text('Are you sure you want to delete ${user.name}?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        userController.deleteUser(user.id!);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
