import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';

abstract class PaymentManager{

//3
  static Future<void>makePayment(int amount ,String currency )async{
    try{
      String clientSecret=  await _getClientSecret((amount*100).toString(), currency);
    await  _intializePaymentSheet(clientSecret);
    await Stripe.instance.presentPaymentSheet();






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


//EGP