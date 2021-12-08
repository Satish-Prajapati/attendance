import 'package:attendance/screens/infopage.dart';
import 'package:attendance/screens/loginpage.dart';
import 'package:attendance/screens/camerapage.dart';
import 'package:attendance/screens/mappage.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => globals.isLoggedIn ? CameraScreen() : LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/camera': (context) => const CameraScreen(),
        '/location': (context) => const MapScreen(),
        '/info': (context) => InfoScreen(),
      },
    );
  }
}
