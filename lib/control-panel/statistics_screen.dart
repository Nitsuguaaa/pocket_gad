import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreen();
}

class _StatisticsScreen extends State<StatisticsScreen> {
  int totalResponses = 10;
  double averageScore = 0.0;
  int studentCount = 0;
  int employeeCount = 0;

  @override
  void initState() {
    super.initState();
    loadStatisticsData();
  }

  Future<void> loadStatisticsData() async {
    final tnaJson = await rootBundle.loadString('assets/dummy-data/TNA_data.json');
    final attendanceJson = await rootBundle.loadString('assets/dummy-data/attendance_data.json');

    final tnaData = json.decode(tnaJson) as Map<String, dynamic>;
    final attendanceData = json.decode(attendanceJson) as Map<String, dynamic>;

    int responses = 0;
    double scoreSum = 0;

    for (var user in tnaData.values) {
      for (var q in user) {
        final score = q.values.first;
        scoreSum += score;
        responses++;
      }
    }

    int students = 0;
    int admins = 0;

    for (var list in attendanceData.values) {
      for (var entry in list) {
        final role = entry.values.first;
        if (role == "student") {
          students++;
        } else if (role == "admin") {
          admins++;
        }
      }
    }

    setState(() {
      totalResponses = responses;
      averageScore = responses > 0 ? (scoreSum / responses) : 0.0;
      studentCount = students;
      employeeCount = admins;
    });
  }

  Widget _buildLandingPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Statistics", style: AppTextStyles.header1),
              Text(" home / Statistics", style: AppTextStyles.body),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFDDCDD5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Statistics", style: AppTextStyles.AppTitle),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF5F5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      _statCard("$totalResponses", "Responses", const Color(0xFF10A3B6)),
                      _statCard(averageScore.toStringAsFixed(2), "ARS", const Color(0xFF05A94F)),
                      _statCard("$studentCount", "Students", const Color(0xFFE6A30E)),
                      _statCard("$employeeCount", "Employees", const Color(0xFFDE2948)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFDDCDD5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Survey Status", style: AppTextStyles.AppTitle),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF5F5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Training Needs Assessment", style: TextStyle(fontFamily: 'Roboto')),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return const Text("Responses");
                                      case 1:
                                        return const Text("Students");
                                      case 2:
                                        return const Text("Employees");
                                    }
                                    return const Text('');
                                  },
                                ),
                              ),
                            ),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(toY: totalResponses.toDouble(), color: Colors.blue, width: 20)
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(toY: studentCount.toDouble(), color: Colors.orange, width: 20)
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(toY: employeeCount.toDouble(), color: Colors.red, width: 20)
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String count, String label, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.bar_chart, color: Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildLandingPage()));
  }
}
