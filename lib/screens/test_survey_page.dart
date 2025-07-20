import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int selectedValue = 0;
  Map<String, dynamic> savedData = {};

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/survey_data.json');
  }

  Future<void> _saveData(Map<String, dynamic> data) async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(data));
  }

  Future<void> _loadSavedData() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        setState(() {
          savedData = data;
          selectedValue = data["satisfaction"] ?? 0;
        });
      }
    } catch (e) {
      print("No saved data found.");
    }
  }

  void _submit() async {
    if (selectedValue == 0) return;

    Map<String, dynamic> data = {
      "satisfaction": selectedValue,
      "timestamp": DateTime.now().toIso8601String(),
    };

    await _saveData(data);

    setState(() {
      savedData = data;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Response saved!")),
    );
  }

  Widget _buildLikertQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How satisfied are you with our service?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            int value = index + 1;
            return Column(
              children: [
                Radio(
                  value: value,
                  groupValue: selectedValue,
                  onChanged: (int? newVal) {
                    setState(() {
                      selectedValue = newVal!;
                    });
                  },
                ),
                Text("$value"),
              ],
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Survey")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLikertQuestion(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text("Submit"),
            ),
            SizedBox(height: 30),
            Divider(),
            Text(
              "Saved Response:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(savedData.isNotEmpty
                ? "Satisfaction: ${savedData['satisfaction']}\nSaved at: ${savedData['timestamp']}"
                : "No saved data yet."),
          ],
        ),
      ),
    );
  }
}