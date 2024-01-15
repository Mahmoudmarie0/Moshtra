import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Wishlist/database/fav_database_helper.dart';

import '../../../models/fav_product_model.dart';

class FavViewModel extends GetxController {

  var dbHelper = FavDatabaseHelper.db;

  ValueNotifier<bool> get loading => ValueNotifier<bool>(false);

  List<FavProductModel> _favProductModel = [];
  List<FavProductModel> get favProductModel => _favProductModel;

  FavViewModel(){
    getAllProduct();
  }

  getAllProduct() async {

    loading.value = true;
    _favProductModel = await dbHelper.getAllProduct();

    loading.value = false;
    // getTotalPrice();
    update();

  }

  addProduct(FavProductModel favProductModel) async {
    for(int i = 0 ; i < _favProductModel.length ; i++){

      if(_favProductModel[i].productId == favProductModel.productId) {
        return;
      }
    }

    await dbHelper.insert(favProductModel);
    _favProductModel.add(favProductModel);
    update();

  }

  deleteProduct(int index) async {

    await dbHelper.deleteProduct(_favProductModel[index].productId!);
    getAllProduct();
    update();
  }

}