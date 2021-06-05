import 'package:allnewcashflow/shared/shared.dart';
import 'package:allnewcashflow/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cash Flow",
      theme: MyTheme.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        Login.routeName: (context) => Login(),
        MainMenu.routeName: (context) => MainMenu(),
        Register.routeName: (context) => Register(),
      },
    );
  }
}
