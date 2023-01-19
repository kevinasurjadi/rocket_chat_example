import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_example/screens/authentication_screen.dart';
import 'package:rocket_chat_example/screens/home_screen.dart';
import 'package:rocket_chat_example/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt.isReady<SharedPreferences>(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsonData =
                getIt<SharedPreferences>().getString('authentication');
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
          } else {
            return Container();
          }
        });
  }
}
