import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe_1/pages/history_sessions.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  //sign out

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 150, 114, 211),
        title: Center(child: const Text('Teacher Home Page')),
        actions: [IconButton(onPressed: null, icon: Icon(null))],
      ),
      drawer: Drawer(
          child: ListView(children: [
        const DrawerHeader(
          child: Icon(
            Icons.settings,
            size: 50,
            color: Color.fromARGB(255, 150, 114, 211),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text(
            'History of Sessions',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HistorySessions()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'LogOut',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            signUserOut();
          },
        )
      ])),
    );
  }
}
