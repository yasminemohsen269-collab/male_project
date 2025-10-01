import 'package:male_project/widgets/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "meals.db");
    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  imageUrl TEXT,
  title TEXT,
  description TEXT,
  time TEXT,
  rate REAL
)


    ''');
  }

  Future<int> insertMeal(Meal meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert("meals", mealMap);
  }

  Future<List<Meal>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealJson = await db.query("meals");
    List<Meal> meals = mealJson
        .map((mealJson) => Meal.fromMap(mealJson))
        .toList();

    return meals;
  }

  Future _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // مثال: إضافة عمود جديد في الإصدار 2
      await db.execute("ALTER TABLE meals ADD COLUMN time TEXT");
    }

    if (oldVersion < 3) {
      // إعادة بناء كاملة في الإصدار 3
      await db.execute("DROP TABLE IF EXISTS meals");
      await _createDatabase(db, newVersion);
    }
  }
}
