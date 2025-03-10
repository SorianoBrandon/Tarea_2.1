import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redit_clone_bs/src/router/path_views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Solo modo vertical
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clone ¿Reddit?',
      routerConfig: paths,
    );
  }
}