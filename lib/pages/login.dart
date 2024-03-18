import 'package:flutter/material.dart';
import 'package:pfe_1/components/my_textfield.dart';
import 'package:pfe_1/components/signin_button.dart';
import 'package:pfe_1/pages/auth_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //texts controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

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
            onTap: signUserIn,
          ),
        ],
      ),
    );
  }
}
