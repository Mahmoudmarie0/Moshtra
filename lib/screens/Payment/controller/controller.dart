import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/models/newCart_model.dart';
import 'package:moshtra/service/take_order.dart';

import '../../../../models/User_model.dart';

class PaymentController extends GetxController{



  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');



  String phone = '0';
  String address  ='';



  User_Model? get userModel => _userModel;
  User_Model? _userModel  ;

  List<new_cart> get myCart => _myCart;
  List<new_cart> _myCart = [];



  PaymentController()
  {
    UserQuery();
    CartQuery();
  }


  int activeIndex=0;





  Future<void> UserQuery() async {
    _loading.value = true;
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user is currently signed in');
      }

      final String? userEmail = currentUser.email;
      if (userEmail == null) {
        throw Exception('Current user email is null');
      }

      final QuerySnapshot<Map<String, dynamic>> userquery = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (userquery.docs.isEmpty) {
        throw Exception('No user found with the given email');
      }

      final user = User_Model.fromsnapshot(userquery.docs[0]);
      _userModel = user;
      phone = _userModel?.phoneNumber ?? '0';
      address = _userModel?.address ?? '';
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _loading.value = false;
      update();
    }
  }


  CartQuery() async{
    _loading.value = true;

    final  cartquery = await FirebaseFirestore.instance
        .collection('cart').get();

    for(int i=0; i<cartquery.docs.length; i++)
      if(cartquery.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid) {
        _myCart.add(new_cart.fromSnapshot(cartquery.docs[i]));
      }

    _loading.value = false;
    update();


  }

  // deleteCart() async {
  //
  //   _loading.value = true;
  //   final  cartquery = await FirebaseFirestore.instance
  //       .collection('cart').get();
  //
  //
  //   for(int i = 0 ; i < cartquery.docs.length ; i++){
  //     if (cartquery.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid){
  //       cart.doc(cartquery.docs[i].id).delete();
  //     }
  //   }
  //   _loading.value = false;
  //   update();
  // }






}