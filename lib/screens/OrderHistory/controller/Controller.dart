import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/models/orderProduct_model.dart';
import 'package:moshtra/models/orders_model.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/User_model.dart';

class orderController extends GetxController {


  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<orders> get myOrders => _myOrders;
  List<orders> _myOrders = [];

  RefreshController refreshController = RefreshController();
  ScrollController scrollController = ScrollController();

  User_Model? get userModel => _userModel;
  User_Model? _userModel ;
  DocumentReference? userRef;

  orderController()
   {
     getUser();
     // getOrder();
     updateOrderStatus();
   }

   getUser() async {

     _loading.value = true;

     final  userQuery = await FirebaseFirestore.instance
         .collection('Users').where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();

      userRef = FirebaseFirestore.instance
         .collection('users').doc(userQuery.docs[0].id);

     _userModel = User_Model.fromsnapshot(userQuery.docs[0]);


     _loading.value = false;
     update();


   }




   getOrder()
   async {
    _loading.value = true;

     final QuerySnapshot<Map<String, dynamic>> orderQuerey =
         await FirebaseFirestore.instance.collection('Users').doc(userRef?.id)
             .collection('orders').get();

     final Loadorders = orderQuerey.docs
         .map((product) => orders.fromSnapshot(product))
         .toList();
     _myOrders = Loadorders;
     List<ProductModel> pro =  [];
     
     final prodQuery = await FirebaseFirestore.instance.collection('Users').doc(userRef?.id)
                    .collection('orders').doc(_myOrders[0].orderId).collection('products').get();

     for(int i=0; i<_myOrders.length; i++)
     {
       final QuerySnapshot<Map<String, dynamic>> productsQuerey =
       await FirebaseFirestore.instance.collection('Users').doc(userRef?.id)
           .collection('orders').doc(_myOrders[i].orderId).collection('products').get();
       final LoadOrderProducts = productsQuerey.docs.map((product) => orderProduct.fromSnapshot(product)).toList();
      _myOrders[i].orderProducts = LoadOrderProducts;
     }


     print('length is =>${_myOrders.length}');
     print(_myOrders[1].orderId);
     print(_myOrders[1].orderProducts[0].productModel.nameAR);


    _loading.value = false;
    update();



   }


  getMyOrders(myorders)async{
    _loading.value = true;

    for(int i=0; i<myorders.length; i++)
    {
      final QuerySnapshot<Map<String, dynamic>> productsQuerey =
      await FirebaseFirestore.instance.collection('Users').doc(userRef?.id)
          .collection('orders').doc(myorders[i].orderId).collection('products').get();
      final LoadOrderProducts = productsQuerey.docs.map((product) => orderProduct.fromSnapshot(product)).toList();
      myorders[i].orderProducts = LoadOrderProducts;
    }

    _loading.value = false;
    update();


  }

 updateOrderStatus() async {

    _loading.value = true;
    await getUser();

    final  ordersQuery = await FirebaseFirestore.instance
           .collection('Users').doc(userRef!.id).collection('orders').get();
       CollectionReference o = FirebaseFirestore.instance.collection('Users').doc(userRef!.id)
           .collection('orders');

       print(ordersQuery.docs.length);
       List<orders> myOrders = [];
       for(int i=0; i<ordersQuery.docs.length;i++)
       {
         DateTime curr = DateTime.now();
         Timestamp orderTime = ordersQuery.docs[i]['orderDate'];
         DateTime myTime = orderTime.toDate();
         Duration diff = curr.difference(myTime);
         int diffInMin = diff.inMinutes;
         if(diffInMin >= 2 && diffInMin < 5)
         {
           print(ordersQuery.docs[i].id);
           print('------------');
           o.doc(ordersQuery.docs[i].id).update({'status':'delivery'});
         }
         else if(diffInMin >= 5){
           o.doc(ordersQuery.docs[i].id).update({'status':'deliveried'});

         }
         myOrders.add(orders.fromSnapshot(ordersQuery.docs[i]));
       }


   _loading.value = false;
   update();

 }

 onRefersh()
 async {
   await updateOrderStatus();

 }
  
  

}