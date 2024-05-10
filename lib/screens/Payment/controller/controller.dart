import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/models/newCart_model.dart';
import 'package:moshtra/service/take_order.dart';

import '../../../../models/User_model.dart';

class PaymentController extends GetxController{

  PaymentController()
  {
    UserQuery();
    CartQuery();
  }


  ValueNotifier<bool>get loading=>_loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);
  String? phone , address;

int activeIndex=0;

  User_Model? get userModel => _userModel;
  User_Model? _userModel ;

  List<new_cart> get myCart => _myCart;
  List<new_cart> _myCart = [];

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');
  CollectionReference order = FirebaseFirestore.instance.collection('order');




  UserQuery() async
  {
    _loading.value = true;

    String? useEmail =  FirebaseAuth.instance.currentUser!.email;



    final QuerySnapshot<Map<String,dynamic>> userquery = await FirebaseFirestore.instance
        .collection('Users').where('email',isEqualTo: useEmail).get();

    final user = User_Model.fromsnapshot(userquery.docs[0]);

    _userModel = user;

    phone = _userModel!.phoneNumber;
    address = _userModel!.address;

    _loading.value = false;
    update();
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

  deleteCart() async {

    _loading.value = true;
    final  cartquery = await FirebaseFirestore.instance
        .collection('cart').get();


    for(int i = 0 ; i < cartquery.docs.length ; i++){
      if (cartquery.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid){
        cart.doc(cartquery.docs[i].id).delete();
      }
    }
    _loading.value = false;
    update();
  }




  TakeOrder() async{
  }

}