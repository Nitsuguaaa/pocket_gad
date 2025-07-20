import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class TnaSurveyPage extends StatefulWidget {
  final String username;

  const TnaSurveyPage({super.key, required this.username});

  @override
  State<TnaSurveyPage> createState() => _TnaSurveyPageState();
}

class _TnaSurveyPageState extends State<TnaSurveyPage> {
  final Map<String, int> responses = {
    'q1': 0,
    'q2': 0,
    'q3': 0,
    'q4': 0,
    'q5': 0,
  };

  final List<String> questions = [
    "1. Gender issues",
    "2. Gender discrimination",
    "3. Gender stereotypes",
    "4. Gender perspective",
    "5. Gender equality",
  ];

  Future<String> _getJsonPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/TNA_data.json";
  }

  Future<void> _submitSurvey() async {
    final path = await _getJsonPath();
    final file = File(path);

    if (!(await file.exists())) {
      await file.create(recursive: true);
    }

    Map<String, dynamic> data = {};
    if (await file.exists()) {
      final contents = await file.readAsString();
      if (contents.isNotEmpty) {
        data = jsonDecode(contents);
      }
    }

    data[widget.username] = [
      {"q1": responses['q1']},
      {"q2": responses['q2']},
      {"q3": responses['q3']},
      {"q4": responses['q4']},
      {"q5": responses['q5']},
    ];

    await file.writeAsString(jsonEncode(data));

    print("TNA_data.json written with: ${jsonEncode(data)}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Survey submitted successfully!")),
    );
    Navigator.pop(context);
  }

  Widget _buildLikert(String question, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: AppTextStyles.body3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            int value = index + 1;
            return Expanded(
              child: RadioListTile<int>(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text('$value'),
                value: value,
                groupValue: responses[key],
                onChanged: (val) {
                  setState(() => responses[key] = val ?? 0);
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TNA Survey"),
        backgroundColor: Color.fromARGB(255, 234, 160, 251),
        foregroundColor: Colors.black,
      ),
      body: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFFFAF6F7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Rate the effectivity of Gender and Development in Batangas State University (1 = Not effective, 5 = Most effective)",
                style: AppTextStyles.body4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ...List.generate(
                5,
                (i) => _buildLikert(questions[i], 'q${i + 1}'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (responses.values.any((v) => v == 0)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please answer all questions."),
                      ),
                    );
                    return;
                  }
                  _submitSurvey();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
