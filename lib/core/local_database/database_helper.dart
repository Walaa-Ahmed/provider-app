import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../constants/constants.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  static Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'pharmacy.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 5);
    return myDb;
  }

  // id INT PRIMARY KEY AUTO_INCREMENT,
  static _onCreate(Database database, int version) async {
    await database.execute('''
  CREATE TABLE $kCart(
    id INT NOT NULL PRIMARY KEY,
        title TEXT,
        description TEXT,
        in_favourite INTEGER,
        price REAL,
        user_quantity INTEGER,
        upc TEXT,
        image TEXT,
        brand_id INTEGER,
        brand_title_en TEXT,
        brand_title_ar TEXT,
        branch_id INTEGER,
        branch_title TEXT,
        branch_phone TEXT,
        branch_address TEXT,
        branch_price TEXT,
        company_image TEXT,
        price_before_discount REAL,
        branch_sub_zone_id INTEGER,
        branch_zone_id INTEGER,
        is_available INTEGER
    )
    ''');
  }

  static Future<void> insertData(
      {required Map<String, dynamic> object,
      required String tableName,
      ConflictAlgorithm? algorithm}) async {
    final database = await db;
    await database?.insert(
      tableName,
      object,
      conflictAlgorithm: algorithm ?? ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>?> getData(
      {required String tableName, String? whereQuery, String? orderBy}) async {
    final database = await db;
    print(whereQuery);
    return await database?.query(tableName,
        orderBy: orderBy, where: whereQuery);
  }

  static Future<List<Map<String, dynamic>>?> selectItems(
      {required String tableName,
      String? whereQuery,
      String? orderBy,
      List<String>? columns,
      int? limit,
      List? whereArgs}) async {
    final database = await db;
    return await database?.query(tableName,
        orderBy: orderBy,
        where: whereQuery,
        whereArgs: whereArgs,
        columns: columns,
        limit: limit,
        distinct: true);
  }

  static Future<void> updateData(
      {required dynamic object,
      required String tableName,
      String? where,
      List? args}) async {
    final database = await db;
    var batch = database?.batch();
    batch?.update(tableName, object,
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: '$where = ?',
        whereArgs: args);

    await batch?.commit();
  }

  static Future<void> deleteData(
      {required String tableName, String? where}) async {
    final database = await db;
    var batch = database?.batch();
    batch?.delete(
      tableName,
      where: where,
    );
    await batch?.commit();
  }
}
