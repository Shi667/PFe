import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe_1/components/my_textfield.dart';
import 'package:pfe_1/components/signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //texts controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method

  void signUserIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      String errorMessage = 'An error occurred.';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'wrong-password':
          case 'user-not-found':
          case 'invalid-credential':
            errorMessage = 'Email or password is incorrect. Please try again.';
            break;
          default:
            errorMessage = e.message ?? errorMessage;
        }
      }
      showErrorMessage(context, errorMessage);
    }
  }

  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 137, 134, 142),
          title: const Text('Error', style: TextStyle(color: Colors.white)),
          content: Text(message),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon
          const Center(
            child: Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(height: 100),
          //Email
          MyTextField(
            controller: emailController,
            hintText: "Email",
            obscureText: false,
          ),
          const SizedBox(height: 20),
          //Password
          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 50),

          //Sign In Button

          SignInButton(
            onTap: () => signUserIn(context),
          ),
        ],
      ),
    );
  }
}
