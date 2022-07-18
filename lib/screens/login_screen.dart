import 'package:bottom_navigation/local_data/storage.dart';
import 'package:bottom_navigation/screens/home_screen.dart';
import 'package:bottom_navigation/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String savedUsername = '';
  String savedPassword = '';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() {
    savedPassword = StorageRepository.getString("password");
    print("savedPasword:$savedPassword");
    savedUsername = StorageRepository.getString("username");
    print("savedUsername:$savedUsername");
  }

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
            TextButton(
              onPressed: () async {
                String username = usernameController.text;
                String password = passwordController.text;
                if (username.length > 3 && password.length > 6) {
                  if (username == savedUsername && password == savedPassword) {
                    await StorageRepository.putBool("isLogged", true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomeScreen();
                    }));
                  } else {
                    //message
                  }
                } else {
                  //message
                }
              },
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return RegisterScreen();
                  }));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
