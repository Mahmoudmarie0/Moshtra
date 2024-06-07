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




  PaymentController()
  {
    UserQuery();
  }


  int activeIndex=0;




  UserQuery() async
  {

    _loading.value = true;
    // String? useEmail =  FirebaseAuth.instance.currentUser!.email;



    final userquery = await FirebaseFirestore.instance
        .collection('Users').get();

    // final user = User_Model.fromsnapshot(userquery.docs[0]);
    for(int i=0; i<userquery.docs.length; i++)
    {
      if(userquery.docs[i]['email'] == FirebaseAuth.instance.currentUser!.email)
        _userModel = (User_Model.fromsnapshot(userquery.docs[i]));
    }

    // _userModel[0] = user;

    // phone = _userModel!.phoneNumber ?? '0';
    // address = _userModel!.address ?? '';

    _loading.value = false;
    update();
  }







}