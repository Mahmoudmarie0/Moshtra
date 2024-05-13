import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/models/products_model.dart';

import '../../../models/new_Category_model.dart';
import '../../../models/products_model.dart';

class DetailsController extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  Cat_Model? get CatModel => _CatModel;
  Cat_Model? _CatModel ;

  String type;

  DetailsController(this.type) {
    RelatedProducts(type);
  }


  RelatedProducts(String Type) async {
    String categotyName = '';
    if (Type == 'Phones' || Type == 'Labtops' || Type == 'Smart watches' || Type == 'camera' ||
        Type == 'Generic' || Type == 'Speakerphone'|| Type == 'GeForce RTX' || Type == 'Storage device' ||
        Type == 'Remote control' || Type == 'Printer' || Type == 'Phone Holder' || Type == 'Mouses')
    {
      categotyName = 'Electronic';
    }
    else
      categotyName = Type;

    _loading.value = true;
    final QuerySnapshot<Map<String, dynamic>> categoryQuery =
    await FirebaseFirestore.instance
        .collection('Categories')
        .where('nameEN', isEqualTo: categotyName).get();
    final Category = Cat_Model.fromSnapshot(categoryQuery.docs[0]);

    _CatModel = Category;
    _loading.value = false;


    if (Type == 'Phones' || Type == 'Labtops' || Type == 'Smart watches' || Type == 'camera')
    {
      if(_CatModel!.product.isEmpty){
        _loading.value = true;

        final QuerySnapshot<Map<String, dynamic>> LoadProductsQuery =
        await FirebaseFirestore.instance
            .collection('Categories')
            .doc(_CatModel!.id)
            .collection('Products').where('type', isEqualTo: Type)
            .get();

        final LoadProducts = LoadProductsQuery.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();

        _CatModel!.product = LoadProducts;


        _loading.value = false;

      }
      update();
    }
    else
    {
      _loading.value = true;
      final QuerySnapshot<Map<String, dynamic>> LoadProductsQuery =
      await FirebaseFirestore.instance
          .collection('Categories')
          .doc(_CatModel!.id)
          .collection('Products')
          .get();

      final LoadProducts = LoadProductsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      _CatModel!.product = LoadProducts;


      _loading.value = false;
      update();
    }

  }
}

