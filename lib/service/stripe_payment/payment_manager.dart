import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';
import '../../models/newCart_model.dart';
import '../../screens/Payment/thankyou/view.dart';

abstract class PaymentManager{

//3
  static Future<void>makePayment(int amount ,String currency )async{
    try{
      String clientSecret=  await _getClientSecret((amount*100).toString(), currency);
    await  _intializePaymentSheet(clientSecret);
    await Stripe.instance.presentPaymentSheet();
      Get.to(ThankYouView());

      CollectionReference cart = FirebaseFirestore.instance.collection('cart');
      // CollectionReference cart = FirebaseFirestore.instance.collection('cart');
      QuerySnapshot cartProducts = await cart.get();

      List<new_cart> cartList = [];

      cartProducts.docs.forEach((doc) {

        // cartList[0].product.quantity
        if(doc.get('userId') == FirebaseAuth.instance.currentUser!.uid){
          cartList.add(new_cart.fromSnapshot(doc));
          // cartProducts.docs[0]['product']['productId'];
          cartList[0].product!.quantity = (int.parse(cartList[0].product!.quantity!) - int.parse(cartList[0].quantity!)).toString();
          cart.doc(doc.id).update({
            'product':cartList[0].product!.toJson(),
          });
        }
      });


      print('CartLength in Payment ${cartList[0].product!.quantity!}');

      print('CartLength in Payment ${cartList.length}');

      await addQuantityAndNumberOfOrderFields(cartList);





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


    // Iterate over each document in the subcollection
    // productsDocs.docs.forEach((subDocument) async {
    //   // print('CategoryId =>  ${mainDocument.id}');
    //   // print('productDocs =>  ${subDocument.id}');
    //   // Update each document in the subcollection by adding the new fields "quantity" and "number of order"
    //   if(subDocument.get('productId') == cartList)
    // });

    for(int i = 0 ; i < cartList.length ; i++) {
      for (int j = 0; j < productsDocs.size; j++) {
        // print('Sized => ${productsDocs.docs[0].get('Sized')}');
        // print('quantity => ${productsDocs.docs[j].get('quantity')}');
        // print('ProductId for Cate => ${productsDocs.docs[j].get('productId')}');
        // print('ProductId for CartList => ${cartList[i].product!.productId}');
        // print('type for Cate => ${productsDocs.docs[j].get('type')}');
        // print('quantity for Cate => ${productsDocs.docs[j].get('quantity')}');
        // print('ProductId for CartList => ${cartList[i].quantity!}');
        if(productsDocs.docs[j].get('productId') == cartList[i].product!.productId){
          print('Done !!');
          var q = int.parse(productsDocs.docs[j].get('quantity')) - int.parse(cartList[i].quantity!);
          assert(q is int);
          var n = int.parse(productsDocs.docs[j].get('number_of_order')) + 1;
          assert(n is int);


          productsDocs.docs[j].reference.update({
            'quantity': q.toString(),
            'number_of_order': n.toString(),
          });

        }

      }
    }
    // for(int i = 0 ; i < cartList.length ; i++){
    //   // productsDocs.docs.forEach((subDocument) async {
    //   //   // print('CategoryId =>  ${mainDocument.id}');
    //   //   // print('productDocs =>  ${subDocument.id}');
    //   //   // Update each document in the subcollection by adding the new fields "quantity" and "number of order"
    //   //   if(subDocument.get('productId') == cartList[i].product!.productId){
    //   //     await subDocument.reference.update({
    //   //       'quantity': subDocument.reference,
    //   //       'number_of_order': 0.toString(),
    //   //     });
    //   //   }
    //   // });
    //
    //
    //
    //
    // }

  });
}



//EGP