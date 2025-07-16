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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).appBarTheme.backgroundColor),
              child: Text('Options'),
            ),
            ListTile(
              title: const Text("Surveys"),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text("Attendance"),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text("Statistics [Admin]"),
              onTap: () {
                
              },
            )
          ],
        ),
      ),
      body: const Center(
        child: Text("This is the control panel"),
      ),
    );
  }
}