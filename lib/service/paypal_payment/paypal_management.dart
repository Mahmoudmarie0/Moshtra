import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

import 'package:moshtra/models/newCart_model.dart';
import 'package:moshtra/screens/Payment/thankyou/view.dart';
import 'package:moshtra/service/paypal_payment/paypal_keys.dart';

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
        "currency": "USD",
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
            "currency": "USD",
            "details": {
              "subtotal": subtotal,
              "shipping": shipping,
              "shipping_discount": 0,
            }
          },
          "description": "The payment transaction description.",
          "item_list": {
            "items": newItems,
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (params) async {
        print("onSuccess: $params"); // Debugging
        Get.back();
        await Get.to(() => ThankYouView(
              total: total,
              subtotal: subtotal,
            ));

        Get.to(() => ThankYouView(
              total: total,
              subtotal: subtotal,
            ));

        print("Navigating to ThankYouView...");
      },
      onError: (error) {
        print("onError: $error"); // Debugging
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:'); // Debugging
      },
    );
  }
}
