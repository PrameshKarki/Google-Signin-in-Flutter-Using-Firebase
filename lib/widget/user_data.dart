import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_signin/providers/google_auth.dart';
import 'package:provider/provider.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL!),
            radius: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name: ${user.displayName}",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Email: ${user.email}",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            icon: const FaIcon(
              FontAwesomeIcons.doorOpen,
            ),
            onPressed: () async {
              final provider = Provider.of<GoogleAuth>(context, listen: false);
              await provider.logoutFromGoogle();
            },
            label: const Text("Log Out"),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 40),
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle: const TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}
