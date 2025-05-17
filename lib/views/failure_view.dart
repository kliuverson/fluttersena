import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  final String err;

  const Failure({super.key, required this.err});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(Icons.error, color: Colors.red),
          Text('Error'),
          Text(err),
        ],
      ),
    );
  }
}
