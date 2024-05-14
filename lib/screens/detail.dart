import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String userId;

  const DetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
            userId
        ),
      ),
    );
  }
}
