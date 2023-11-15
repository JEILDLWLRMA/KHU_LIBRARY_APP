import 'package:flutter/material.dart';

class Notimplement extends StatelessWidget {
  const Notimplement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOT IMPLEMENT YET'),
      ),
      body: const Center(
        child: Text('Go Back to HOME!'),
      ),
    );
  }
}
