import 'package:bottom_navigation/local_data/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await StorageRepository.deleteBool("isLogged");
                  await StorageRepository.deleteString("username");
                  await StorageRepository.deleteString("password");
                  await StorageRepository.deleteString("age");
                  SystemNavigator.pop();
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
