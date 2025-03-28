import 'package:extraedge_spacex/app.dart';
import 'package:extraedge_spacex/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // String path = join(await getDatabasesPath(), 'test.db');
  // Database db =
  //     await openDatabase(path, version: 1, onCreate: (db, version) async {
  //   await db.execute('CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)');
  // });
  // print('Database opened at: $path');
  runApp(
      // const MaterialApp(
      //   home: Scaffold(
      //     body: Center(
      //       child: Text('sample app'),
      //     ),
      //   ),
      // ),
      const App());
}
