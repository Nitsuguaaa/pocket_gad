import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class AttendancesScreen extends StatefulWidget {
  const AttendancesScreen({super.key});

  @override
  State<AttendancesScreen> createState() => _AttendancesScreen();
}

class _AttendancesScreen extends State<AttendancesScreen> {
  Widget _buildLandingPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        Row(children: [
          Text("Attendance ", style: AppTextStyles.header1),
          Text(" home / Attendance", style: AppTextStyles.body)
        ],),
        Container(child: Column(children: [ //ATTENDANCE AVAILABLE

        ],),)
      ],)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Attendance")),
      body: Center(
        child: _buildLandingPage(),
      ),
    );
  }
}