import 'package:flutter/material.dart';
import 'package:pocket_gad/screens/control_panel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlaceHolder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 160, 251)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 234, 160, 251)
        )
      ),
      home: const LandingPage(), // start here
      /*routes: {
        '/LandingPage': (context) => const LandingPage(),
        '/contact': (context) => const ContactPage(),
        '/more': (context) => const MoreInfoPage(),
      },*/
    );
  }
}