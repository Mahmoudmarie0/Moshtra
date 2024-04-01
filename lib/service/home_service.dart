import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/new_Sub_category_model.dart';
import '../models/products_model.dart';


//used to connect to sevice

class HomeService {
  //take instance of collection from firestore
  CollectionReference _categoryCollectionRef = FirebaseFirestore.instance
      .collection('Categories');

  CollectionReference _productCollectionRef = FirebaseFirestore.instance
      .collection("Products");

  CollectionReference _smartwatchesCollectionRef = FirebaseFirestore.instance
      .collection("SmartWatches");

  CollectionReference _electronicsCollectionRef = FirebaseFirestore.instance
      .collection("Electronics");

  CollectionReference _bannersCollectionRef = FirebaseFirestore.instance
      .collection('Banners');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }


  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }


  Future<List<QueryDocumentSnapshot>> getElectronics() async {
    var value = await FirebaseFirestore.instance
        .collection("Categories")
        .doc("402rlzLRvORxZt8Ysi2J")
        .collection("Electronics")
        .get();
     return value.docs;
  }



  Future<List<QueryDocumentSnapshot>> getSmartWatches() async {
    var value = await FirebaseFirestore.instance
    .collection("Categories")
    .doc("402rlzLRvORxZt8Ysi2J")
    .collection("Electronics")
    .doc("ADDQTeRGTM23ZaS0tanU")
    .collection("SmartWatches")
    .get();
    return value.docs;
  }




  Future<List<QueryDocumentSnapshot>> getBanners() async {
    var value = await _bannersCollectionRef.get();
    return value.docs;
  }

    void getSubCat() async{
    final QuerySnapshot<Map<String,dynamic>>SubCatQuery = await FirebaseFirestore.instance
        .collection('Categories').get();
    final SubCat = SubCatQuery.docs.map((subcat) => Sub_Cat.fromSnapshot(subcat)).toList();

    print(SubCat[0].name);

    for(Sub_Cat sub in SubCat)
    {
      final QuerySnapshot<Map<String,dynamic>> cat_productsQuery = await FirebaseFirestore.instance
      .collection('Categories').doc(sub.id).collection('Electronics').get();
      final catProduct = cat_productsQuery.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      sub.product = catProduct;

    }

  }




}