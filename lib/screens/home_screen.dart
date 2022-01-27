import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/user_data.dart';
import '../widget/sign_up.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something went wrong!",
              style: TextStyle(fontSize: 20),
            ),
          );
        } else if (snapshot.hasData) {
          return UserData();
        } else {
          return SignUp();
        }
      },
    );
  }
}
