//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:moshtra/screens/Categories/Electronic/electronics.dart';
// import 'package:moshtra/screens/Home_layout/controller.dart';
//
// import '../../../Dio/DioHelper.dart';
// import '../../../utils/constants/components.dart';
// import '../../../utils/constants/endpoints.dart';
// import '../category_model.dart';
//
// class CategoriesController extends GetxController{
//     CategoriesModel? categoriesModel;
// HomeLayoutController homeLayoutController=Get.put(HomeLayoutController());
//
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   getCategoriesData();
//   update();
//   }
//    void getCategoriesData()async{
//     await  DioHelper.getData(url: Endpoints.getCategories,
//         token: token,
//       ).then((value){
//         if(value!=null)
//           categoriesModel=CategoriesModel.fromJson(value.data);
//       }).catchError((error){
//         print(error.toString());
//       });
//       update();
//
//     }
//     Widget buildCatItem(DataModel model)=>
//         InkWell(
//
//           onTap:()=>homeLayoutController.Electronic(),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 Image(
//                   image:
//                   NetworkImage
//                     (model.image!),
//
//                   width: 80.0,
//                   height: 80.0,
//                   fit: BoxFit.cover,
//
//
//
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Text(model.name!,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//
//                   ),),
//                 Spacer(),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                 ),
//
//
//
//
//
//
//               ],
//
//
//
//
//             ),
//           ),
//         );
//
//
//
//
//
//
//
//
//
//
//
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/models/smart_watches_model.dart';

import '../../../models/category_model.dart';
import '../../../models/new_Category_model.dart';
import '../../../models/new_Sub_category_model.dart';
import '../../../models/products_model.dart';
import '../../../service/home_service.dart';

class CategoryController extends GetxController {

  ValueNotifier<bool>get loading=>_loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);

  // List <CategoryModel> get categoryModel => _categoryModel;
  // List <CategoryModel> _categoryModel = [];


  List<Cat_Model> get CatModel => _CatModel;
  List<Cat_Model> _CatModel = [];

  List<Sub_Cat> get SubCatModel => SubCatModel;
  List<Sub_Cat> _SubCatModel = [];



  List <ElectronicsModel> get electronicsModel=>_electronicsModel;
  List <ElectronicsModel> _electronicsModel=[];
  List <SmartWatchesModel> get smartwatchesModel=>_smartwatchesModel;
  List <SmartWatchesModel> _smartwatchesModel=[];

  CategoryController(){
    // getCategory();
    getElectronics();
    getSmartWatches();
    getSubCat();
    // CategoryQuery();
    newCatQuery();
  }


  // getCategory() async {
  //   _loading.value=true;
  //   HomeService().getCategory().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
  //       _loading.value=false;
  //     }
  //     update();
  //   });
  // }
  getElectronics()async{
    _loading.value=true;
    HomeService().getElectronics().then((value) {
      for(int i=0;i<value.length;i++){
        _electronicsModel.add(ElectronicsModel.fromJson(value[i].data() as Map));

        _loading.value=false;
      }
      update();

    });

  }
  getSmartWatches()async {
    _loading.value = true;
    HomeService().getSmartWatches().then((value) {
      for (int i = 0; i < value.length; i++) {
        _smartwatchesModel.add(SmartWatchesModel.fromJson(value[i].data()as Map));
        _loading.value = false;
      }
      update();
    });
  }

  void getSubCat() async{
    final QuerySnapshot<Map<String,dynamic>>SubCatQuery = await FirebaseFirestore.instance
        .collection('Categories').get();
    final SubCat = SubCatQuery.docs.map((subcat) => Sub_Cat.fromSnapshot(subcat)).toList();
for(int i=0;i<SubCat.length;i++){
    // print(SubCat[i].name);
    // print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
}

    for(Sub_Cat sub in SubCat)
    {
      final QuerySnapshot<Map<String,dynamic>> cat_productsQuery = await FirebaseFirestore.instance
          .collection('Categories').doc(sub.id).collection('Electronics').get();
      final catProduct = cat_productsQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      sub.product = catProduct;
    }

  }



  // CategoryQuery() async{
  //   _loading.value = true;
  //   final QuerySnapshot<Map<String,dynamic>> CatQuerey = await FirebaseFirestore.instance
  //       .collection('Categories').get();
  //   final Category = CatQuerey.docs.map((category) => Cat_Model.fromSnapshot(category)).toList();
  //   print('/////////////////////////////////////');
  //   print('category.........${Category[0].name}');
  //
  //   _CatModel = Category;
  //
  //   print(_CatModel[0].name);
  //
  //   for (Cat_Model _cat_model in _CatModel)
  //   {
  //     final QuerySnapshot<Map<String,dynamic>> SubCatQuery = await FirebaseFirestore.instance
  //         .collection('Categories').doc(_cat_model.id).collection('SubCategory').get();
  //     final SubCategory = SubCatQuery.docs.map((sub_cat) => Sub_Cat.fromSnapshot(sub_cat)).toList();
  //
  //
  //
  //     _cat_model.sub_cat = SubCategory;
  //
  //     for (Sub_Cat _sub in _cat_model.sub_cat)
  //     {
  //       final QuerySnapshot<Map<String,dynamic>> CatProductQuery = await FirebaseFirestore.instance
  //           .collection('Categories').doc(_cat_model.id)
  //           .collection('SubCategory').doc(_sub.id).collection('Products').get();
  //
  //       final CatProduct = CatProductQuery.docs.map((product) => ProductModel.fromSnapshot(product))
  //           .toList();
  //       _sub.product = CatProduct;
  //     }
  //   }
  //
  //
  //   print('_____________________________________________________________');
  //   print(_CatModel[9].sub_cat[0].product[0].name);
  //   _loading.value = false;
  //   update();
  //
  // }


  newCatQuery() async {
    _loading.value = true;
    final QuerySnapshot<Map<String,dynamic>> CatQuerey = await FirebaseFirestore.instance
        .collection('Categories').get();
    final Category = CatQuerey.docs.map((category) => Cat_Model.fromSnapshot(category)).toList();
    print('/////////////////////////////////////');
    print('category.........${Category[0].name}');

    _CatModel = Category;
    print(_CatModel[0].name);
    print(_CatModel.length);


    // for (Cat_Model _cat_model in _CatModel)
    // {
    //   final QuerySnapshot<Map<String,dynamic>> CatProductQuery = await FirebaseFirestore.instance
    //       .collection('Categories').doc(_cat_model.id).collection('Products').get();
    //   final CatProduct = CatProductQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
    //   _cat_model.product = CatProduct;
    // }
    // print('___________________________________________________________________________________');
    // for(int i = 0 ; i<_CatModel.length;i++)
    // {
    //   print(_CatModel[i].product[0].name);
    // }
    print('___________________________________________________________________________________');
    _loading.value = false;
    update();

  }


  LoadData(int index) async{
    loading.value = true;
    if (_CatModel[index].product.isEmpty)
    {
      final QuerySnapshot<Map<String,dynamic>> LoadProductsQuery = await FirebaseFirestore.instance
          .collection('Categories').doc(_CatModel[index].id).collection('Products').get();
      final LoadProducts = LoadProductsQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      _CatModel[index].product = LoadProducts;
    }
    loading.value = false;
    update();
  }

}