import 'package:flutter/material.dart';

class HistorySessions extends StatelessWidget {
  const HistorySessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Sessions'),
      ),
      body: const Center(
        child: Text('History Sessions'),
      ),
    );
  }
}
