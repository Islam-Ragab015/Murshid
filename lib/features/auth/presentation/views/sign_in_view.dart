import 'package:flutter/material.dart';
import 'package:murshid/core/functions/navigation.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              customNavigate(context, "/signUp");
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: const Center(
        child: Text("Sign In"),
      ),
    );
  }
}
