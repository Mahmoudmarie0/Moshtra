import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/cart_product_model.dart';
import 'card_database_helper.dart';

class CartViewModel  extends GetxController {

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  ValueNotifier<bool> get loading => ValueNotifier<bool>(false);



  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();

    loading.value = false;
    getTotalPrice();
    update();
  }


  getTotalPrice(){
    _totalPrice = 0;
    for(int i = 0 ; i <= _cartProductModel.length ; i++){
      _totalPrice += double.parse(_cartProductModel[i].price!) * _cartProductModel[i].quantity!;
    }
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for(int i = 0 ; i < _cartProductModel.length ; i++){
      if(_cartProductModel[i].productId == cartProductModel.productId){
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice += double.parse(cartProductModel.price!) * cartProductModel.quantity!;
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += double.parse(_cartProductModel[index].price!);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;
    _totalPrice -= double.parse(_cartProductModel[index].price!);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  deleteProduct(int index) async {

    await dbHelper.deleteProduct(_cartProductModel[index].productId!);
    getAllProduct();
    update();
  }

}