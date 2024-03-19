import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //sign out

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
          child: Text('H O M E   P A G E'),
        ));
  }
}
