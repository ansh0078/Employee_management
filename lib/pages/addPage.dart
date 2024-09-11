import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Profile"),
      ),
      body: Column(
        children: [
          const Text("Add Page"),
        ],
      ),
    );
  }
}