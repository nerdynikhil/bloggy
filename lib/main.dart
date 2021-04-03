import 'package:bloggy/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloggy Demo',
      home: FutureBuilder(
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == '0')
              return SplashScreen(
                Homepage(),
              );
            return SplashScreen(
              Dashboard(),
            );
          }
        },
        future: getPage(),
      ),
    );
  }

  getPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.get('login') ?? '0';
    return id;
  }
}
