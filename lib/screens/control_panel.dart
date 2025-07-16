import 'package:flutter/material.dart';
import 'package:pocket_gad/control-panel/statistics_screen.dart';
import 'package:pocket_gad/control-panel/surveys_screen.dart';
import 'package:pocket_gad/control-panel/attendances_screen.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  Widget _currentScreen = const SurveysScreen();

  void _selectScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Text('Options'),
            ),
            ListTile(
              title: const Text("Surveys"),
              onTap: () {
                _selectScreen(const SurveysScreen());
              },
            ),
            ListTile(title: const Text("Attendance"), onTap: () {
                _selectScreen(const AttendancesScreen());
            }),
            ListTile(title: const Text("Statistics [Admin]"), onTap: () {
                _selectScreen(const StatisticsScreen());
            }),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }
}
