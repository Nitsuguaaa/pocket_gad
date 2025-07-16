
import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreen();
}

class _StatisticsScreen extends State<StatisticsScreen> {
  Widget _buildLandingPage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        Row(children: [
          Text("Dashboard   ", style: AppTextStyles.header1,),
          Text("   home / dashboard")
        ],),
        Container(child: Column(children: [ //STATISTICS
          Text("Statistics"),
          Text("Responses: "),
          Text("Average Respone Score: "),
          Text("Students: "),
          Text("Employees")
        ],),),
        Container(child: Column(children: [ //SURVEY STATUS
          Text("Survey Status"),
          Text("Training Needs Assessment")
        ],),)

      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Statistics")),
      body: Center(
        child: _buildLandingPage(),
      ),
    );
  }
}