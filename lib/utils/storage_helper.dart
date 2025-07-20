import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/attendance_data.json');
  }

  static Future<Map<String, dynamic>> readJson() async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        final assetData = await rootBundle.loadString(
          'assets/dummy-data/attendance_data.json',
        );
        final initialData = jsonDecode(assetData);
        initialData.putIfAbsent("aribaKababaihan", () => []);
        initialData.putIfAbsent("gadTalk2024", () => []);

        await file.writeAsString(jsonEncode(initialData));
        return initialData;
      }

      final contents = await file.readAsString();
      final data = jsonDecode(contents);

      data.putIfAbsent("aribaKababaihan", () => []);
      data.putIfAbsent("gadTalk2024", () => []);

      return data;
    } catch (e) {
      print('[StorageHelper] readJson error: $e');
      return {"aribaKababaihan": [], "gadTalk2024": []};
    }
  }

  static Future<void> writeJson(Map<String, dynamic> data) async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(data));
  }
}
