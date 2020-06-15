import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Money of preparation of action
class SharedPrefMoney {
  gestionOfMoney(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt('money', value);
  }

  Future<int> getGestionOfMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('money');
  }
}

// Team of preparation of action
class SharedPrefTeam {
  Future<dynamic> readTeam(String key) async {
    final prefsTeam = await SharedPreferences.getInstance();
    return json.decode(prefsTeam.getString('team'));
  }

  saveTeam(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
    String response = await _loadATeamAsset();
    var responseJson = json.decode(response);
    responseJson.writeAsString(responseJson);
  }

  removeTeam(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

Future<String> _loadATeamAsset() async {
  return await rootBundle.loadString('assets/team/team.json');
}
