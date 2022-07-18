import 'package:bottom_navigation/local_data/storage.dart';
import 'package:bottom_navigation/screens/home_screen.dart';
import 'package:bottom_navigation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
            ),
            TextField(
              controller: passwordController,
            ),
            TextField(
              controller: ageController,
            ),
            TextButton(
                onPressed: () async {
                  if (usernameController.text.length > 3 &&
                      passwordController.text.length > 6 &&
                      ageController.text.isNotEmpty) {
                    await StorageRepository.putString(
                        key: "username", value: usernameController.text);
                    await StorageRepository.putString(
                        key: "password", value: passwordController.text);
                    await StorageRepository.putString(
                        key: "age", value: ageController.text);
                  }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                },
                child: Text("Register User"))
          ],
        ),
      ),
    );
  }
}
