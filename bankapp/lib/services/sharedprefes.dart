import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/model.dart';

class SharedPrefs with ChangeNotifier {
  late SharedPreferences _prefs;

  Future<void> getSharedPrefes() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> saveData(String key, List<Model> models) async {
    final List<String> jsonList =
        models.map((model) => jsonEncode(model.toJson())).toList();
    await _prefs.setStringList(key, jsonList);
    notifyListeners();
  }

  List<Model> getData(String key) {
    final List<String>? jsonList = _prefs.getStringList(key);
    if (jsonList == null) return [];
    return jsonList.map((json) => Model.fromJson(jsonDecode(json))).toList();
  }
}
