import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/models/User_model.dart';

import '../models/newCart_model.dart';
import '../models/orders_model.dart';
import '../models/products_model.dart';

import '../screens/auth/register/controller/controller.dart';

class take_order {

  dynamic total;
  String phone , address;
  List<ProductModel> products;
  List<new_cart> cartList;


  take_order({required this.total, required this.phone, required this.address,
    required this.products, required this.cartList});




  CartPayment()async{
    print('on proccess');
    addOrder();


    updateQuantityAndNumberOfOrderFields(cartList);

    updateQuantityInCart(cartList);

    updateQuantityInHome(cartList);

    DeleteCartAfterPayment(cartList);

    print('Done!');


  }

  BuyNowPayment()async{

    addOrder()async {

      final  userQuery = await FirebaseFirestore.instance
          .collection('Users').where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();

      DocumentReference userRef = FirebaseFirestore.instance
          .collection('users').doc(userQuery.docs[0].id);



      DocumentReference orederRef = await FirebaseFirestore.instance
          .collection('Users').doc(userRef.id).collection('orders').add({
        'orderDate':DateTime.now(),
        'DelivryDate':DateTime.now().add(Duration(days: 5)),
        'totalPrice': total.toString(),
        'paymentMethod': 'Cridit Card',
        'orderPhone' : phone,
        'orderAddress': address,
        'status': 'Picked',
      });

      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('Users').doc(userRef.id).collection('orders').doc(orederRef.id)
          .collection('products');






      for(int i=0;i<products.length;i++)
      {
        productCollection.add({
          'product':products[i].toJson(),
          'quantity': cartList[i].quantity
        });
      }

      // final  ordersQuery = await FirebaseFirestore.instance
      //     .collection('Users').doc(userRef.id).collection('orders').get();
      // CollectionReference o = FirebaseFirestore.instance.collection('Users').doc(userRef.id)
      //     .collection('orders');
      //
      // print(ordersQuery.docs.length);
      // List<orders> myOrders = [];
      // for(int i=0; i<ordersQuery.docs.length;i++)
      // {
      //   DateTime curr = DateTime.now();
      //   Timestamp orderTime = ordersQuery.docs[i]['orderDate'];
      //   DateTime myTime = orderTime.toDate();
      //   Duration diff = curr.difference(myTime);
      //   int diffInMin = diff.inMinutes;
      //   if(diffInMin >= 2 && diffInMin < 5)
      //   {
      //     print(ordersQuery.docs[i].id);
      //     print('------------');
      //     o.doc(ordersQuery.docs[i].id).update({'status':'delivery'});
      //   }
      //   else if(diffInMin >= 5){
      //     o.doc(ordersQuery.docs[i].id).update({'status':'deliveried'});
      //
      //   }
      //   myOrders.add(orders.fromSnapshot(ordersQuery.docs[i]));
      // }



    }


    Future<void> updateQuantityAndNumberOfOrderFields(List<new_cart> cartList) async {

      // Get a reference to the main collection
      CollectionReference categories = FirebaseFirestore.instance.collection('Categories');

      // Get all documents from the main collection
      QuerySnapshot categoriesDocs = await categories.get();

      // Iterate over each document in the main collection
      categoriesDocs.docs.forEach((mainDocument) async {
        // Get a reference to the subcollection of the current document
        CollectionReference products = mainDocument.reference.collection('Products');
        // mainDocument.get('name');
        // print('categoriesDocs =>  ${mainDocument.id}');

        // Get all documents from the subcollection
        QuerySnapshot productsDocs = await products.get();


        for(int i = 0 ; i < cartList.length ; i++) {
          for (int j = 0; j < productsDocs.size; j++) {

            if(productsDocs.docs[j].get('productId') == cartList[i].product!.productId){
              var q = int.parse(productsDocs.docs[j].get('quantity')) - int.parse(cartList[i].quantity!);
              assert(q is int);
              var n = int.parse(productsDocs.docs[j].get('number_of_order')) + 1;
              assert(n is int);


              productsDocs.docs[j].reference.update({
                'quantity': q.toString(),
                'number_of_order': n.toString(),
              });
              print('Done Fun1 !!');

            }

          }
        }
      });
    }

    Future<void> updateQuantityInCart(List<new_cart> cartList) async {

      CollectionReference cart = FirebaseFirestore.instance.collection('cart');

      QuerySnapshot cartProducts = await cart.get();

      for(int i = 0 ; i < cartList.length ; i++){
        for(int j = 0 ; j < cartProducts.size ; j++){

          if(cartList[i].product!.productId! == cartProducts.docs[j].get('product')['productId']){

            var q = int.parse(cartProducts.docs[j].get('product')['quantity']) - int.parse(cartList[i].quantity!);
            assert(q is int);
            var n = int.parse(cartProducts.docs[j].get('product')['number_of_order']) + 1;
            assert(n is int);


            cartProducts.docs[j].reference.update({
              'quantity' : "1" ,
              'product.quantity' : q.toString() ,
              'product.number_of_order' : n.toString(),
            });
            print('Done Fun2 !!');

          }

        }
      }

    }

    Future<void> updateQuantityInHome(List<new_cart> cartList) async {
      CollectionReference cart = FirebaseFirestore.instance.collection('Products');

      QuerySnapshot homeProducts = await cart.get();

      for(int i = 0 ; i < cartList.length ; i++){
        for(int j = 0 ; j < homeProducts.size ; j++){

          if(cartList[i].product!.productId! == homeProducts.docs[j].get('productId')){

            var q = int.parse(homeProducts.docs[j].get('quantity')) - int.parse(cartList[i].quantity!);
            assert(q is int);
            var n = int.parse(homeProducts.docs[j].get('number_of_order')) + 1;
            assert(n is int);

            homeProducts.docs[j].reference.update({
              'quantity' : q.toString(),
              'number_of_order': n.toString(),
            });
            print('Done Fun3 !!');

          }

        }
      }

    }

  }



  addOrder()async {

    final  userQuery = await FirebaseFirestore.instance
        .collection('Users').where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();

    DocumentReference userRef = FirebaseFirestore.instance
        .collection('users').doc(userQuery.docs[0].id);



    DocumentReference orederRef = await FirebaseFirestore.instance
        .collection('Users').doc(userRef.id).collection('orders').add({
      'orderDate':DateTime.now(),
      'DelivryDate':DateTime.now().add(Duration(days: 5)),
      'totalPrice': total.toString(),
      'paymentMethod': 'Cridit Card',
      'orderPhone' : phone,
      'orderAddress': address,
      'status': 'Picked',
    });

    CollectionReference productCollection = FirebaseFirestore.instance
        .collection('Users').doc(userRef.id).collection('orders').doc(orederRef.id)
        .collection('products');






    for(int i=0;i<products.length;i++)
    {
      productCollection.add({
        'product':products[i].toJson(),
        'quantity': cartList[i].quantity
      });
    }

    // final  ordersQuery = await FirebaseFirestore.instance
    //     .collection('Users').doc(userRef.id).collection('orders').get();
    // CollectionReference o = FirebaseFirestore.instance.collection('Users').doc(userRef.id)
    //     .collection('orders');
    //
    // print(ordersQuery.docs.length);
    // List<orders> myOrders = [];
    // for(int i=0; i<ordersQuery.docs.length;i++)
    // {
    //   DateTime curr = DateTime.now();
    //   Timestamp orderTime = ordersQuery.docs[i]['orderDate'];
    //   DateTime myTime = orderTime.toDate();
    //   Duration diff = curr.difference(myTime);
    //   int diffInMin = diff.inMinutes;
    //   if(diffInMin >= 2 && diffInMin < 5)
    //   {
    //     print(ordersQuery.docs[i].id);
    //     print('------------');
    //     o.doc(ordersQuery.docs[i].id).update({'status':'delivery'});
    //   }
    //   else if(diffInMin >= 5){
    //     o.doc(ordersQuery.docs[i].id).update({'status':'deliveried'});
    //
    //   }
    //   myOrders.add(orders.fromSnapshot(ordersQuery.docs[i]));
    // }



  }


  Future<void> updateQuantityAndNumberOfOrderFields(List<new_cart> cartList) async {

    // Get a reference to the main collection
    CollectionReference categories = FirebaseFirestore.instance.collection('Categories');

    // Get all documents from the main collection
    QuerySnapshot categoriesDocs = await categories.get();

    // Iterate over each document in the main collection
    categoriesDocs.docs.forEach((mainDocument) async {
      // Get a reference to the subcollection of the current document
      CollectionReference products = mainDocument.reference.collection('Products');
      // mainDocument.get('name');
      // print('categoriesDocs =>  ${mainDocument.id}');

      // Get all documents from the subcollection
      QuerySnapshot productsDocs = await products.get();


      for(int i = 0 ; i < cartList.length ; i++) {
        for (int j = 0; j < productsDocs.size; j++) {

          if(productsDocs.docs[j].get('productId') == cartList[i].product!.productId){
            var q = int.parse(productsDocs.docs[j].get('quantity')) - int.parse(cartList[i].quantity!);
            assert(q is int);
            var n = int.parse(productsDocs.docs[j].get('number_of_order')) + 1;
            assert(n is int);


            productsDocs.docs[j].reference.update({
              'quantity': q.toString(),
              'number_of_order': n.toString(),
            });
            print('Done Fun1 !!');

          }

        }
      }
    });
  }

  Future<void> updateQuantityInCart(List<new_cart> cartList) async {

    CollectionReference cart = FirebaseFirestore.instance.collection('cart');

    QuerySnapshot cartProducts = await cart.get();

    for(int i = 0 ; i < cartList.length ; i++){
      for(int j = 0 ; j < cartProducts.size ; j++){

        if(cartList[i].product!.productId! == cartProducts.docs[j].get('product')['productId']){

          var q = int.parse(cartProducts.docs[j].get('product')['quantity']) - int.parse(cartList[i].quantity!);
          assert(q is int);
          var n = int.parse(cartProducts.docs[j].get('product')['number_of_order']) + 1;
          assert(n is int);


          cartProducts.docs[j].reference.update({
            'quantity' : "1" ,
            'product.quantity' : q.toString() ,
            'product.number_of_order' : n.toString(),
          });
          print('Done Fun2 !!');

        }

      }
    }

  }

  Future<void> updateQuantityInHome(List<new_cart> cartList) async {
    CollectionReference cart = FirebaseFirestore.instance.collection('Products');

    QuerySnapshot homeProducts = await cart.get();

    for(int i = 0 ; i < cartList.length ; i++){
      for(int j = 0 ; j < homeProducts.size ; j++){

        if(cartList[i].product!.productId! == homeProducts.docs[j].get('productId')){

          var q = int.parse(homeProducts.docs[j].get('quantity')) - int.parse(cartList[i].quantity!);
          assert(q is int);
          var n = int.parse(homeProducts.docs[j].get('number_of_order')) + 1;
          assert(n is int);

          homeProducts.docs[j].reference.update({
            'quantity' : q.toString(),
            'number_of_order': n.toString(),
          });
          print('Done Fun3 !!');

        }

      }
    }

  }

  Future<void> DeleteCartAfterPayment(List<new_cart> cartList) async {

    CollectionReference cart = FirebaseFirestore.instance.collection('cart');

    QuerySnapshot cartProducts = await cart.get();

    for(int i = 0 ; i < cartList.length ; i++){
      for(int j = 0 ; j < cartProducts.size ; j++){

        if(cartList[i].product!.productId! == cartProducts.docs[j].get('productId')){

          cartProducts.docs[j].reference.delete();

          print('User Cart Deleted !!');

        }
      }
    }
  }


}