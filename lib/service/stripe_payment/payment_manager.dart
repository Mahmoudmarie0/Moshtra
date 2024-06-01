import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';
import 'package:moshtra/service/take_order.dart';
import '../../models/newCart_model.dart';
import '../../models/products_model.dart';
import '../../screens/Payment/thankyou/view.dart';

abstract class PaymentManager{


//3
  static Future<void>makePayment(int total ,String currency,List<ProductModel> products,List<new_cart> cartList,dynamic phone,dynamic address,dynamic subtotal )async{
    try{
      String clientSecret=  await _getClientSecret((total*100).toString(), currency);
    await  _intializePaymentSheet(clientSecret);
    await Stripe.instance.presentPaymentSheet();
      Get.off(ThankYouView( total: total, subtotal: subtotal,));
      products;
      cartList;
      total;
      phone;
      address;


      CollectionReference cart = FirebaseFirestore.instance.collection('cart');

      // CollectionReference cart = FirebaseFirestore.instance.collection('cart');
      QuerySnapshot cartProducts = await cart.get();

      //List<new_cart> cartList = [];

      cartProducts.docs.forEach((doc) {

        // cartList[0].product.quantity
        if(doc.get('userId') == FirebaseAuth.instance.currentUser!.uid){
          cartList.add(new_cart.fromSnapshot(doc));
        }
      });
      take_order(total: total, phone: phone, address: address, products: products, cartList: cartList).CartPayment();
      print('order taken');
      // print('CartLength in Payment ${cartList[0].product!.quantity!}');
      //
      // print('CartLength in Payment ${cartList.length}');

      // await addQuantityAndNumberOfOrderFields(cartList);
      // await updateQuantityInHome(cartList);
      // await updateQuantityInCart(cartList);




    }catch(error){
     throw Exception(error.toString());
    }
  }


  //2
  //intialize payment sheet
  static Future<void>_intializePaymentSheet(String clientSecret)async{
   await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret:clientSecret,
          merchantDisplayName: "basel",

        )
    );


  }




//1
  //this function : to call stripe and send the amount and currency and return the client secret
  static Future <String> _getClientSecret(String amount ,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];



  }



}


Future<void> addQuantityAndNumberOfOrderFields(List<new_cart> cartList) async {

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



//EGP