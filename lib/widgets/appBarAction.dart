import 'package:employee_management/pages/addPage.dart';
import 'package:employee_management/pages/homePage.dart';
import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (value) {
        switch (value) {
          case 'Add':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPage(),
              ),
            );
            break;
          case 'Refresh':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Add',
            child: Row(
              children: [
                const Icon(Icons.person_add_outlined, size: 18),
                const SizedBox(width: 10),
                Text(
                  'Add User',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'Refresh',
            child: Row(
              children: [
                const Icon(Icons.refresh_outlined, size: 18),
                const SizedBox(width: 10),
                Text('Refresh User', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ];
      },
    );
  }
}
