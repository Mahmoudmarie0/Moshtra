import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../models/User_model.dart';

class PaymentController extends GetxController{

  PaymentController()
  {
    UserQuery();
  }

  ValueNotifier<bool>get loading=>_loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);
  String? phone , address;



  User_Model? get userModel => _userModel;
  User_Model? _userModel ;

  UserQuery() async
  {
    _loading.value = true;


    final QuerySnapshot<Map<String,dynamic>> userquery = await FirebaseFirestore.instance
        .collection('Users').get();

    final user = userquery.docs.map((user) => User_Model.fromJson(user)).toList();

    for(int i=0;i<user.length;i++)
    {
      if(user[i].email == FirebaseAuth.instance.currentUser!.email)
      {
        _userModel = user[i];
      }
    }
    phone = _userModel!.phoneNumber;
    address = _userModel!.address;

    _loading.value = false;
    update();
  }

}