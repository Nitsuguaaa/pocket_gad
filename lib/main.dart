import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // your custom screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 190, 46, 222)),
        useMaterial3: true,
      ),
      home: const LandingPage(), // start here
      /*routes: {
        '/about': (context) => const AboutMePage(),
        '/contact': (context) => const ContactPage(),
        '/more': (context) => const MoreInfoPage(),
      },*/
    );
  }
}