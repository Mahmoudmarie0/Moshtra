import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moshtra/screens/MyCart/database/cart_view_model.dart';
import 'package:moshtra/screens/checkout/shipping_adress_screen.dart';
class PaymentMethodScreen extends StatefulWidget {
  //const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type =1;
  void _handleRadio(Object? e) =>setState(() {
    _type=e as int;
  });
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        title: Text("Payment Method"),
        leading:BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child:Column(children: [
                SizedBox(height: 40),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type==1
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("Amazon Pay",
                                style: _type==1 ? TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.w500,color: Colors.black) : TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,color: Colors.grey),
                              ),
                            ],
                          ),
                          Image.asset("assets/images/amazon-pay.png",
                            width:100, height: 100,fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type==2
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("Visa card",
                                style: _type==2 ? TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.w500,color: Colors.black) : TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,color: Colors.grey),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image.asset("assets/images/Visa.png",
                            width:35,
                          ),
                          SizedBox(width: 8),
                          Image.asset("assets/images/Master-Card.png",
                            width:35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type==3
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 3,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("PayPal",
                                style: _type==3? TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.w500,color: Colors.black) : TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,color: Colors.grey),
                              ),
                            ],
                          ),
                          Image.asset("assets/images/PayPal.png",
                            width:50,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type==4
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 4,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("Google Pay",
                                style: _type==4? TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.w500,color: Colors.black) : TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,color: Colors.grey),
                              ),
                            ],
                          ),
                          Image.asset("assets/images/Google-Pay.png",
                            width:70,
                            height: 70,

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$300",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Shipping Free",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$15.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Divider(height: 30
                  ,color: Colors.black,
                ),

                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$580",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,),
                    ),
                  ],
                ),

                GetBuilder<CartViewModel>(
                  builder:(controller) => ElevatedButton(
                    onPressed: (){
                      Get.to(ShippingAdress());
                    },

                    child: Text('Confirm Payment' ,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



//
// import 'package:flutter/material.dart';
// class DeliveryTime extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[
//           Container(
//             child: Text(
//               "Delivery",
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }