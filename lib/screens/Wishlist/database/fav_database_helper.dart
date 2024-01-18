import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/fav_product_model.dart';
import 'constance.dart';

class FavDatabaseHelper {

  FavDatabaseHelper._();
  static final FavDatabaseHelper db = FavDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {

    if(_database != null) return _database!;

    _database = await initDb();
    return _database!;

  }

  initDb() async {

    String path = join(await getDatabasesPath() , 'FavProduct.db');

    return await openDatabase(
        path ,
        version: 1,
        onCreate: (Database db , int version) async {
          await db.execute( '''
					CREATE TABLE $tableFavProduct (
						$columnName TEXT NOT NULL,
						$columnImage TEXT NOT NULL,
						$columnPrice TEXT NOT NULL,
						$columnProductId TEXT NOT NULL)
				''');
        }
    );
  }

  insert(FavProductModel model) async{
    var dbClient = await database;

    await dbClient.insert(
      tableFavProduct,
      model.toJson() ,
      conflictAlgorithm:  ConflictAlgorithm.replace ,
    ) ;
  }

  Future<List<FavProductModel>>getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableFavProduct);
    List<FavProductModel> list = maps.isNotEmpty ?
    maps.map((product) => FavProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  updateProduct(FavProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableFavProduct , model.toJson(),
        where: '$columnProductId = ?',
        whereArgs: [model.productId]
    );
  }

  deleteProduct(String productId) async {
    var dbClient = await database;
    return await dbClient.delete(tableFavProduct , where: '$columnProductId = ?' , whereArgs: [productId] );

  }

}