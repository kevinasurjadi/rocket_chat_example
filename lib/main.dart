import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_example/authentication_screen.dart';
import 'package:rocket_chat_example/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jsonData = sharedPreferences.getString('authentication');
    Authentication? authentication;
    if (jsonData != null) {
      authentication = Authentication.fromMap(jsonDecode(jsonData));
    }
    return MaterialApp(
      title: 'Rocket Chat Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authentication != null
          ? HomeScreen(
              authentication: authentication,
            )
          : const AuthenticationScreen(),
    );
  }
}
