import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/cart.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    _db = await initDatabase();
    if (_db != null) {
      return _db;
    }
    return null;
  }

  initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE food (foodID VARCHAR UNIQUE, foodName TEXT, foodPrice INTEGER, quantity INTEGER, foodImage TEXT, deliveryCharges INTEGER, foodTotalPrice INTEGER');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query("food");
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
}
