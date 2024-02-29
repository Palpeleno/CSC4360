import 'dart:async';
import 'dart:io';
// import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import './card_photo_helper.dart';

// TODO add
// import 'package:/assets/img';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photoName';
  static const String TABLE = 'photosTable';
  static const String DB_Name = 'photos.db';

  Future<Database?> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $TABLE ($ID INTEGER, $NAME CARDNAME)');
  }

  Future<CardModel> save(CardModel photo) async {
    var dbClient = await db;
    print(photo.photoName);
    photo.id = await dbClient!.insert(TABLE, photo.toMap());
    print(photo.id);
    return photo;
  }

  Future<List<CardModel>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(TABLE, columns: [ID, NAME]);
    List<CardModel> photos = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(CardModel.fromMap(Map<String, dynamic>.from(maps[i])));
      }
    }
    print("photos {{$photos}}");
    return photos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }

  // Future<String> join(String path, String db_name) async {

  // }
}
