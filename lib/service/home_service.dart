import 'package:cloud_firestore/cloud_firestore.dart';


//used to connect to sevice

class HomeService {
  CollectionReference _categoryCollectionRef = FirebaseFirestore.instance
      .collection('Categories');
  CollectionReference _productCollectionRef = FirebaseFirestore.instance
      .collection("Products");
  CollectionReference _electronicCollectionRef = FirebaseFirestore.instance
      .collection("Electronic");
  CollectionReference _electronicsCollectionRef = FirebaseFirestore.instance
      .collection("Electronics");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }


  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getElectronics() async {
    var value = await _electronicsCollectionRef.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getElectronic() async {
    var value = await _electronicCollectionRef.get();
    return value.docs;
  }
}