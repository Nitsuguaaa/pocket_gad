import 'package:flutter/material.dart';

//SCREENS
import 'package:pocket_gad/control-panel/statistics_screen.dart';
import 'package:pocket_gad/control-panel/surveys_screen.dart';
import 'package:pocket_gad/control-panel/attendances_screen.dart';
import 'package:pocket_gad/screens/landing_page.dart';
import 'package:pocket_gad/screens/login_page.dart';

//ASSETS
import 'package:pocket_gad/utils/app_text_style.dart';

class ControlPanel extends StatefulWidget {
  final String username;
  final String role;

  const ControlPanel({super.key, required this.username, required this.role});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = SurveysScreen(
      username: widget.username,
      role: widget.role,
    );
  }

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
        title: const Text("Dashboard", style: AppTextStyles.AppTitle),
        backgroundColor: Color.fromARGB(255, 234, 160, 251),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor ??
                    const Color(0xFFEAA0FB),
              ),
              child: Text('Options', style: AppTextStyles.header1),
            ),
            ListTile(
              title: const Text("Surveys", style: AppTextStyles.body),
              onTap: () {
                _selectScreen(SurveysScreen(
                  username: widget.username,
                  role: widget.role,
                ));
              },
            ),
            ListTile(
              title: const Text("Attendance", style: AppTextStyles.body),
              onTap: () {
                _selectScreen(AttendancesScreen(
                  username: widget.username,
                  role: widget.role,
                ));
              },
            ),
            ListTile(
              title: const Text("Logout", style: AppTextStyles.body),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
            ),
            if (widget.role == 'admin')
              ListTile(
                title: const Text(
                  "Statistics [Admin]",
                  style: AppTextStyles.body,
                ),
                onTap: () {
                  _selectScreen(const StatisticsScreen());
                },
              ),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }
}
