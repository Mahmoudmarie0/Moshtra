import 'package:flutter/cupertino.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

import 'package:moshtra/service/paypal_payment/paypal_keys.dart';

import '../../models/newCart_model.dart';
import '../../models/products_model.dart';

abstract class PaypalManager {
  static PaypalCheckout buildPaypalCheckout(
      BuildContext context,
      List<ProductModel> products,
      dynamic total,
      dynamic shipping,
      dynamic subtotal,
      List<new_cart> cartList,
      dynamic phone,
      dynamic address) {
    List<Map<String, dynamic>> newItems = [];

    cartList.forEach((product) {
      newItems.add({
        "name": Get.locale?.languageCode == "en"
            ? product.product!.nameEN
            : product.product!.nameAR,
        "price": product.product!.price.toString(),
        "currency": "EUR",
        "quantity": product.quantity,
      });
    });


    print(newItems);

    return PaypalCheckout(
      sandboxMode: true,
      clientId: '${PaypalKeys.clientId}',
      secretKey: '${PaypalKeys.secretKey}',
      returnURL: "success.snippetcoder.com",
      cancelURL: "cancel.snippetcoder.com",
      transactions: [
        {


          "amount": {
            "total": total,
            "currency": "EUR",
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
            "items": newItems,

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
        products;
        cartList;
        total;
        phone;
        address;
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
