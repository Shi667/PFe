import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe_1/pages/teacherpage.dart';
import 'package:pfe_1/pages/error.dart';
import 'package:pfe_1/pages/loadingpage.dart';
import 'package:pfe_1/pages/login.dart';
import 'package:pfe_1/pages/studenthomepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Future<String> getUserType(String uid) async {
    // Fetch the user type from Firebase
    // Replace 'users' and 'type' with your actual collection and field names
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return doc['type'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder<String>(
                future: getUserType(snapshot.data!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == 'teacher') {
                      return const TeacherHomePage();
                    } else if (snapshot.data == 'student') {
                      return const StudentHomePage();
                    } else {
                      return const Error(); // Return an error page if the user type is unknown
                    }
                  } else if (snapshot.hasError) {
                    return const Error(); // Return an error page if fetching the user type failed
                  } else {
                    return const LoadingPage(); // Return a loading page while fetching the user type
                  }
                },
              );
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
