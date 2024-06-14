//ejemplo de statelessWidget
// lib/widgets/my_stateless_widget.dart

// lib/widgets/my_stateless_widget.dart

import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;

  MyStatelessWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
