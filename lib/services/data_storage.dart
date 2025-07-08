import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/grade_entry.dart';

class DataStorage {
  static const _entriesKey = 'entries';

  Future<List<GradeEntry>> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_entriesKey);
    if (jsonStr == null) return [];
    final List list = jsonDecode(jsonStr);
    return list.map((e) => GradeEntry.fromJson(e)).toList();
  }

  Future<void> saveEntries(List<GradeEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final str = jsonEncode(entries.map((e) => e.toJson()).toList());
    await prefs.setString(_entriesKey, str);
  }
}