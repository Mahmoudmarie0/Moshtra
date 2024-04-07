import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Home/controller/Controller.dart';

class searchController extends GetxController {
  @override
  void onInit() {
    super.onInit();
   // searchProducts(SearchController.text);
    update();
  }

  final TextEditingController search = TextEditingController();
  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection('Products');
  HomeController homeController=Get.put(HomeController());

  List<dynamic> searchResults = [];
  bool isLoading = false;

  void searchProducts(String searchText) {

      isLoading = true;


    productsCollection
        .where('name',
        isGreaterThanOrEqualTo: searchText,
        isLessThan: searchText + 'z')
        .get()
        .then((QuerySnapshot querySnapshot) {

        searchResults = querySnapshot.docs
            .map((doc) => doc['name'] as String )
            .toList();


        isLoading = false;
        update();

    }).catchError((error) {

        isLoading = false;

      print('Error searching products: $error');
    });
  }



}