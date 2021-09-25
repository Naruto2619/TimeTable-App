import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_table/screens/auth_screen.dart';
import './screens/homepage.dart';
import './screens/dayscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> checklogin() async {
      var prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('userdata')) {
        return false;
      }
      return true;
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: checklogin(),
          builder: (ctx, snapshot) {
            if (snapshot.data == true) {
              return AuthScreen();
            } else {
              return AuthScreen();
            }
          }),
    );
  }
}
