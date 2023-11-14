// details_modal.dart

import 'package:flutter/material.dart';

class DetailsModal extends StatelessWidget {
  final String name;

  DetailsModal({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Selected Name: $name",
              style: TextStyle(fontSize: 20),
            ),
            // Add more details or actions as needed
          ],
        ),
      ),
    );
  }
}