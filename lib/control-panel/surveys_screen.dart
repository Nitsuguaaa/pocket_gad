import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';
import 'package:pocket_gad/control-panel/TNA_survey.dart';

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SurveysScreen extends StatefulWidget {
  final String username;
  final String role;

  const SurveysScreen({super.key, required this.username, required this.role});

  @override
  State<SurveysScreen> createState() => _SurveysScreen();
}

class _SurveysScreen extends State<SurveysScreen> {
  bool hasAnsweredTna = false;

  @override
  void initState() {
    super.initState();
    _checkIfAnswered();
  }

  Future<void> _checkIfAnswered() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/TNA_data.json');
      if (await file.exists()) {
        final content = await file.readAsString();
        final data = content.isNotEmpty ? jsonDecode(content) : {};
        if (data.containsKey(widget.username)) {
          setState(() => hasAnsweredTna = true);
        }
      }
    } catch (e) {
      print("Failed to read TNA_data.json: $e");
    }
  }

  Widget _buildLandingPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Surveys ", style: AppTextStyles.header1),
              Text(" home / Surveys", style: AppTextStyles.body),
            ],
          ),
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            //padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFDDCDD5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Survey List", style: AppTextStyles.AppTitle),

                // TNA Survey Button
                ElevatedButton(
                  onPressed: hasAnsweredTna
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TnaSurveyPage(username: widget.username),
                            ),
                          ).then((_) {
                            _checkIfAnswered();
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "TNA",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Active",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "GREAT",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Paused",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _buildLandingPage()));
  }
}
