import 'package:bottom_navigation/local_data/storage.dart';
import 'package:bottom_navigation/screens/home_screen.dart';
import 'package:bottom_navigation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkState() async {
    await Future.delayed(Duration(seconds: 3));
    await StorageRepository.getInstance();

    var isLogged = StorageRepository.getBool("isLogged");
    print("IS LOGGED:$isLogged");
    if (isLogged) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    }
  }

  @override
  void initState() {
    checkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen"),
      ),
    );
  }
}
