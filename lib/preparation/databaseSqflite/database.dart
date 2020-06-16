import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dju/preparation/material/model/material.model.dart';
import 'package:dju/preparation/team/model/team.model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

 // Affichage et gestion de l equipe
class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _databaseTeam;

  Future<Database> get database async {
    if (_databaseTeam != null) return _databaseTeam;
    // if _database is null we instantiate it
    _databaseTeam = await initDBTeam();
    return _databaseTeam;
  }

  initDBTeam() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBTeam.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE Team (id INTEGER AUTO_INCREMENT PRIMARY KEY, name TEXT, capacityExplosiveFactor INTEGER,capacityHostageFactor INTEGER,capacityTechnologyFactor INTEGER,capacityWeaponFactor INTEGER,crazyFactor INTEGER,fearFactor INTEGER,happyFactor INTEGER,image TEXT,positionOfPlan TEXT,status TEXT,trustPlanFactor INTEGER,trustProfessorFactor INTEGER,price INTEGER,selected TEXT)');
    });
  }

  createDBTeam(Team team) async {
    final db = await database;
    final res =await db.insert('Team', team.toJson());
    return res;
  }

  updateTeam(Team newTeam) async {
    final db = await database;
    var res = await db.update("Team", newTeam.toJson(),
        where: "id = ?", whereArgs: [newTeam.id]);
    return res;
  }


   // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Team');

    return res;
  }

  Future<List<Team>> getAllTeam() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Team");

    List<Team> list =
        res.isNotEmpty ? res.map((c) => Team.fromJson(c)).toList() : [];

    return list;
  }

  deleteTeam(int id) async {
    final db = await database;
    return db.delete("Team", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Team");
  }
}

class TeamApiProvider {
  Future<List<Team>> getAllTeam() async {
    var url = await rootBundle.loadString('assets/team/team.json');
    List responseJson = json.decode(url);

    return (responseJson).map((team) {
      print('Inserting $team');
      DBProvider.db.createDBTeam(Team.fromJson(team));
    }).toList();
  }
}



   // Affichage et gestion du matériel
   class DBProviderMaterial {
  DBProviderMaterial._();

  static final DBProviderMaterial db = DBProviderMaterial._();

  Database _databaseMaterial;

  Future<Database> get database async {
    if (_databaseMaterial != null) return _databaseMaterial;
    // if _database is null we instantiate it
    _databaseMaterial = await initDBMaterial();
    return _databaseMaterial;
  }

  initDBMaterial() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBMaterial.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE Material (id INTEGER AUTO_INCREMENT PRIMARY KEY,activ INTEGER, dangerous INTEGER,distance INTEGER,image TEXT, name TEXT,price INTEGER,quantity INTEGER,timing INTEGER, type TEXT,selected TEXT)');
    });
  }

  createDBMaterial(MaterialPreparation material) async {
    final db = await database;
    final res =await db.insert('Material', material.toJson());
    return res;
  }

  updateMaterial(MaterialPreparation newMaterial) async {
    final db = await database;
    var res = await db.update("Material", newMaterial.toJson(),
        where: "id = ?", whereArgs: [newMaterial.id]);
    return res;
  }


   // Delete all employees
  Future<int> deleteAllMaterial() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM newMaterial');

    return res;
  }

  Future<List<MaterialPreparation>> getAllMaterial() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Material");

    List<MaterialPreparation> list =
        res.isNotEmpty ? res.map((c) => MaterialPreparation.fromJson(c)).toList() : [];

    return list;
  }

  deleteMaterial(int id) async {
    final db = await database;
    return db.delete("Material", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Material");
  }
}

class MaterialApiProvider {
  Future<List<MaterialPreparation>> getAllMaterial() async {
    var url = await rootBundle.loadString('assets/material/material.json');
    List responseJson = json.decode(url);

    return (responseJson).map((material) {
      print('Inserting $material');
      DBProviderMaterial.db.createDBMaterial(MaterialPreparation.fromJson(material));
    }).toList();
  }
}