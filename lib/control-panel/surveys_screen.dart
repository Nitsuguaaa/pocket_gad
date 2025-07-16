import 'package:flutter/material.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({super.key});

  @override
  State<SurveysScreen> createState() => _SurveysScreen();
}

class _SurveysScreen extends State<SurveysScreen> {
  Widget _buildLandingPage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        Row(children: [
          Text("Surveys   "),
          Text("   home / Surveys")
        ],)
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Survey")),
      body: Center(
        child: _buildLandingPage(),
      ),
    );
  }
}