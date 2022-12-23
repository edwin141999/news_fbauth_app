import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_fbauth_app/screens/home_screen.dart';

class AuthService {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('users');

  Future<void> signInUser(
    String name,
    String lastName,
    String email,
    String password,
    BuildContext ctx,
  ) async {
    if (name.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Todos los campos son requeridos',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      try {
        await ref.push().set({
          'name': name,
          'lastName': lastName,
          'email': email,
          'password': password,
          'createdAt': DateTime.now().toString(),
        });
        Future.delayed(const Duration(seconds: 3), () {
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Te haz registrado correctamente',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> logInUser(String email, String password) async {
  }

  sigInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
