import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/google_auth.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn-images-1.medium.com%2Fmax%2F1200%2F1*5-aoK8IBmXve5whBQM90GA.png&f=1&nofb=1",
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            "Hi There",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Login to your account to continue",
            style: TextStyle(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(
            height: 70,
          ),
          ElevatedButton.icon(
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.redAccent[700],
            ),
            onPressed: () async {
              final provider = Provider.of<GoogleAuth>(context, listen: false);
              await provider.loginWithGoogle();
            },
            label: const Text("Sign up with Google"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
