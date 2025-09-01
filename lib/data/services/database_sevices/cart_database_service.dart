import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseService {
  static const _dbName = 'cart.db';
  static const _dbVersion = 1;
  static const _tableName = 'cart';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            thumbnail TEXT,
            price REAL,
            quantity INTEGER
          )
        ''');
      },
    );
  }

  Future<void> addItem({required Map<String, dynamic> item}) async {
    final db = await database;
    final existing = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [item['id']],
    );

    if (existing.isEmpty) {
      await db.insert(_tableName, {...item, 'quantity': 1});
    } else {
      final currentQty = existing.first['quantity'] as int;
      await db.update(
        _tableName,
        {'quantity': currentQty + 1},
        where: 'id = ?',
        whereArgs: [item['id']],
      );
    }
  }

  Future<void> removeItem({required int id}) async {
    final db = await database;
    final existing = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    final currentQty = existing.first['quantity'] as int;
    if (currentQty == 1) {
      await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
    } else {
      await db.update(
        _tableName,
        {'quantity': currentQty - 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<List<Map<String, dynamic>>> getItemsWithQuantity() async {
    final db = await database;
    return await db.query(_tableName);
  }

  Future<void> deleteItem({required int id}) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
