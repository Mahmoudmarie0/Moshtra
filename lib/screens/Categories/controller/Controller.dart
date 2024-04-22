import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/models/smart_watches_model.dart';

import '../../../models/new_Category_model.dart';
import '../../../models/new_Sub_category_model.dart';
import '../../../models/products_model.dart';
import '../../../service/home_service.dart';

class CategoryController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<Cat_Model> get CatModel => _CatModel;
  List<Cat_Model> _CatModel = [];

  // List<Sub_Cat> get SubCatModel => SubCatModel;
  // List<Sub_Cat> _SubCatModel = [];

  List<ElectronicsModel> get electronicsModel => _electronicsModel;
  List<ElectronicsModel> _electronicsModel = [];
  List<SmartWatchesModel> get smartwatchesModel => _smartwatchesModel;
  List<SmartWatchesModel> _smartwatchesModel = [];

  CategoryController() {
    getElectronics();
    getSmartWatches();
    getSubCat();
    newCatQuery();
  }

  getElectronics() async {
    _loading.value = true;
    HomeService().getElectronics().then((value) {
      for (int i = 0; i < value.length; i++) {
        _electronicsModel
            .add(ElectronicsModel.fromJson(value[i].data() as Map));

        _loading.value = false;
      }
      update();
    });
  }

  getSmartWatches() async {
    _loading.value = true;
    HomeService().getSmartWatches().then((value) {
      for (int i = 0; i < value.length; i++) {
        _smartwatchesModel
            .add(SmartWatchesModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  void getSubCat() async {
    final QuerySnapshot<Map<String, dynamic>> SubCatQuery =
        await FirebaseFirestore.instance.collection('Categories').get();

    final SubCat =
        SubCatQuery.docs.map((subcat) => Sub_Cat.fromSnapshot(subcat)).toList();
    for (int i = 0; i < SubCat.length; i++) {}

    for (Sub_Cat sub in SubCat) {
      final QuerySnapshot<Map<String, dynamic>> cat_productsQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .doc(sub.id)
              .collection('Electronics')
              .get();
      final catProduct = cat_productsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
      sub.product = catProduct;
    }
  }

  newCatQuery() async {
    _loading.value = true;
    final QuerySnapshot<Map<String, dynamic>> CatQuerey =
        await FirebaseFirestore.instance.collection('Categories').get();
    final Category = CatQuerey.docs
        .map((category) => Cat_Model.fromSnapshot(category))
        .toList();

    _CatModel = Category;
    print(_CatModel[0].name);
    print(_CatModel.length);

    _loading.value = false;
    update();
  }

  LoadData(int index) async {
    loading.value = true;
    if (_CatModel[index].product.isEmpty) {
      final QuerySnapshot<Map<String, dynamic>> LoadProductsQuery =
          await FirebaseFirestore.instance
              .collection('Categories')
              .doc(_CatModel[index].id)
              .collection('Products')
              .get();
      final LoadProducts = LoadProductsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
      _CatModel[index].product = LoadProducts;
    }
    loading.value = false;
    update();
  }
}
