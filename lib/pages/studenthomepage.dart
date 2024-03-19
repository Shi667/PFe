import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page'), actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ]),
        body: const Center(
          child: Text('S T U D E N T   H O M E   P A G E'),
        ));
  }
}
