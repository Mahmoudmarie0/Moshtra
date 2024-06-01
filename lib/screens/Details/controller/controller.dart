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


  int get med => _med;
  int _med = 0;


  Cat_Model? get EgCatModel => _EgCatModel;
  Cat_Model? _EgCatModel ;


  String type;

  DetailsController(this.type) {
    RelatedProducts(type);
    RelatedEgyptianProducts(type);
    getBestSelling2();
  }




  RelatedProducts(String Type) async {
    String categotyName = getCatName(Type);
    
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

  RelatedEgyptianProducts(String Type) async {

    _loading.value = true;
    final QuerySnapshot<Map<String, dynamic>> categoryQuery =
    await FirebaseFirestore.instance
        .collection('Categories')
        .where('nameEN', isEqualTo: 'Egyptian Products').get();
    final Category = Cat_Model.fromSnapshot(categoryQuery.docs[0]);

    _EgCatModel = Category;
    _loading.value = false;


    if (Type == 'Phones' || Type == 'Labtops' || Type == 'Smart watches' || Type == 'camera')
    {
      if(_EgCatModel!.product.isEmpty){
        _loading.value = true;

        final QuerySnapshot<Map<String, dynamic>> LoadProductsQuery =
        await FirebaseFirestore.instance
            .collection('Categories')
            .doc(_EgCatModel!.id)
            .collection('Products').where('type', isEqualTo: Type)
            .get();

        final LoadProducts = LoadProductsQuery.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();

        _EgCatModel!.product = LoadProducts;


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
          .doc(_EgCatModel!.id)
          .collection('Products').where('type' , isEqualTo: Type)
          .get();

      final LoadProducts = LoadProductsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      _EgCatModel!.product = LoadProducts;


      _loading.value = false;
      update();
    }

  }



  String getCatName(String type)
  {
    String categotyName = '';
    if ( type == 'Phones' || type == 'Labtops' || type == 'Smart watches' || type == 'camera' ||
        type == 'Generic' || type == 'Speakerphone'|| type == 'GeForce RTX' || type == 'Storage device' ||
        type == 'Remote control' || type == 'Printer' || type == 'Phone Holder' || type == 'Mouses')

      categotyName = 'Electronic';
    else
      categotyName = type;

    return categotyName;
  }


  getBestSelling2()
  async {
    _loading.value = true;
    List<int> no_of_orders = [];
    final QuerySnapshot<Map<String, dynamic>> CatQuerey =
    await FirebaseFirestore.instance.collection('Categories').get();
    final Category = CatQuerey.docs
        .map((category) => Cat_Model.fromSnapshot(category))
        .toList();


    for(int i=0; i<Category.length;i++)
    {
      final QuerySnapshot<Map<String, dynamic>> LoadProductsQuery =
      await FirebaseFirestore.instance
          .collection('Categories')
          .doc(Category[i].id)
          .collection('Products')
          .get();
      final LoadProducts = LoadProductsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
      for(int j=0; j<LoadProducts.length; j++)
      {
        no_of_orders.add(int.parse(LoadProducts[j].number_of_order as String));
      }


    }
    no_of_orders.sort();

    _med = no_of_orders[no_of_orders.length-10];
    // return _med;
    _loading.value = false;
    update();

  }



}

