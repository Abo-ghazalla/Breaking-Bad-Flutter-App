import 'package:breaking_bad_app/config/app_router/imports.dart';
import 'package:breaking_bad_app/config/constants/resources.dart' as constants;
import 'package:breaking_bad_app/locator.dart';
import 'package:flutter/material.dart';

void main() {
  locatorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Fix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.blueGrey[800],
        textTheme: constants.appTextTheme,
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
