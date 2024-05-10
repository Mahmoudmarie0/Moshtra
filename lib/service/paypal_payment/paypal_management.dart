import 'package:flutter/cupertino.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import 'package:moshtra/service/paypal_payment/paypal_keys.dart';
import 'package:path/path.dart';

 abstract class PaypalManager  {

   static  PaypalCheckout buildPaypalCheckout(BuildContext context) {
     double subtotal = 100.0;
     double shipping = 0.0;
     double calculatedTotal = subtotal + shipping;

       return PaypalCheckout(
         sandboxMode: true,
         clientId: '${PaypalKeys.clientId}',
         secretKey: '${PaypalKeys.secretKey}',
         returnURL: "success.snippetcoder.com",
         cancelURL: "cancel.snippetcoder.com",
         transactions:  [
           {

             "amount": {
               "total": calculatedTotal,
               "currency": "USD",
               "details": {
                 "subtotal": subtotal,
                 "shipping": shipping,
                 "shipping_discount": 0
               }
             },
             "description": "The payment transaction description.",
             // "payment_options": {
             //   "allowed_payment_method":
             //       "INSTANT_FUNDING_SOURCE"
             // },
             "item_list": {
               "items": [
                 {
                   "name": "Apple",
                   "quantity": 20,
                   "price": '5',
                   "currency": "USD"
                 },
                 // {
                 //   "name": "Pineapple",
                 //   "quantity": 0,
                 //   "price": '0',
                 //   "currency": "USD"
                 // }
               ],

               // shipping address is not required though
               //   "shipping_address": {
               //
               //     "recipient_name": "Raman Singh",
               //     "line1": "Delhi",
               //     "line2": "",
               //     "city": "Delhi",
               //     "country_code": "IN",
               //     "postal_code": "11001",
               //     "phone": "+00000000",
               //     "state": "Texas"
               //  },
             }
           }
         ],
         note: "Contact us for any questions on your order.",
         onSuccess: (Map params) async {
           print("onSuccess: $params");
         },
         onError: (error) {
           print("onError: $error");
           Navigator.pop(context);
         },
         onCancel: () {
           print('cancelled:');
         },
       );
     }






  }




