import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';
import 'package:pocket_gad/utils/storage_helper.dart';

class AttendancesScreen extends StatefulWidget {
  final String username;
  final String role;

  const AttendancesScreen({
    super.key,
    required this.username,
    required this.role,
  });

  @override
  State<AttendancesScreen> createState() => _AttendancesScreen();
}

class _AttendancesScreen extends State<AttendancesScreen> {
  Widget _buildLandingPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Attendance ", style: AppTextStyles.header1),
              Text(" home / Attendance", style: AppTextStyles.body),
            ],
          ),
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFDDCDD5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Attendance List", style: AppTextStyles.AppTitle),
                const SizedBox(height: 10),

                _attendanceButton(
                  title: "ARIBA! Kababaihan 2025",
                  status: "Active",
                  color: Colors.green,
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Attendance'),
                        content: const Text(
                          'Mark attendance for ARIBA! Kababaihan 2025?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Confirm'),
                          ),
                        ],
                      ),
                    );

                    if (confirmed == true) {
                      final username = widget.username;
                      final role = widget.role;
                      final data = await StorageHelper.readJson();
                      final List<dynamic> aribaList = data["aribaKababaihan"];

                      bool alreadyPresent = aribaList.any(
                        (entry) => entry[username] != null,
                      );

                      if (!alreadyPresent) {
                        aribaList.add({username: role});
                        data["aribaKababaihan"] = aribaList;
                        await StorageHelper.writeJson(data);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Attendance recorded!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You have already signed in.'),
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(height: 10),
                _attendanceButton(
                  title: "GAD Talk 2024",
                  status: "Ended",
                  color: Colors.red,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('This event has already concluded.'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _attendanceButton({
    required String title,
    required String status,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 1,
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildLandingPage()),
    );
  }
}
