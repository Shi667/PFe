import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

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
          child: Text('E R R O R   P A G E'),
        ));
  }
}
