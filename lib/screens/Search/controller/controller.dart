import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../models/new_Category_model.dart';
import '../../../models/products_model.dart';


class searchController extends GetxController {
  @override
  void onInit() {
    super.onInit();
   // searchProducts(SearchController.text);
    update();
  }

//   final TextEditingController search = TextEditingController();
//   final CollectionReference productsCollection =
//   FirebaseFirestore.instance.collection('Products');
//   HomeController homeController=Get.put(HomeController());
//
//   List<dynamic> searchResults = [];
//   bool isLoading = false;
//
//   void searchProducts(String searchText) {
//
//       isLoading = true;
// //dddd
//
//     productsCollection
//         .where('nameEN',
//         isGreaterThanOrEqualTo: searchText,
//         isLessThan: searchText + 'z')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//
//         searchResults = querySnapshot.docs
//             .map((doc) => doc['nameEN'] as String )
//             .toList();
//
//
//         isLoading = false;
//         update();
//
//     }).catchError((error) {
//
//         isLoading = false;
//
//       print('Error searching products: $error');
//     });
//   }



  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  Cat_Model? get CatModel => _CatModel;
  Cat_Model? _CatModel ;

  Cat_Model? get EgCatModel => _EgCatModel;
  Cat_Model? _EgCatModel ;

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



}