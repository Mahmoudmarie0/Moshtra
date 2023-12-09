import 'package:cloud_firestore/cloud_firestore.dart';


//used to connect to sevice

class HomeService{
    CollectionReference _categoryCollectionRef=FirebaseFirestore.instance.collection('Categories');
    CollectionReference _productCollectionRef=FirebaseFirestore.instance.collection("Products");

Future<List<QueryDocumentSnapshot>>getCategory()async{
  var value=await _categoryCollectionRef.get();
  return value.docs;

  }


    Future<List<QueryDocumentSnapshot>>getBestSelling()async{
      var value=await _productCollectionRef.get();
      return value.docs;

    }
}