import 'package:flutter/material.dart';

class AttendancesScreen extends StatefulWidget {
  const AttendancesScreen({super.key});

  @override
  State<AttendancesScreen> createState() => _AttendancesScreen();
}

class _AttendancesScreen extends State<AttendancesScreen> {
  Widget _buildLandingPage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const Text("ayoooo!"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Screen")),
      body: Center(
        child: _buildLandingPage(),
      ),
    );
  }
}
