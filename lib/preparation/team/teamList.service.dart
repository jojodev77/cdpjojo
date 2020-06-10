import 'dart:convert';

import 'package:dju/preparation/team/model/team.model.dart';
import 'package:flutter/services.dart';

Future<String> _loadATeamAsset() async {
  return await rootBundle.loadString('assets/team/team.json');
}


Future<List<Team>> fetchPosts() async {
 String response = await _loadATeamAsset();
  List responseJson = json.decode(response);
  return responseJson.map((m) => new Team.fromJson(m)).toList();
}