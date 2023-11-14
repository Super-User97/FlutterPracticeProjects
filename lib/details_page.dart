// details_page.dart

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;

  DetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Text(
          "Selected Name: $name",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}