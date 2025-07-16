import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Widget _buildLandingPage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const Text("This is the landing page"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page")),
      body: Center(
        child: _buildLandingPage(),
      ),
    );
  }
}
