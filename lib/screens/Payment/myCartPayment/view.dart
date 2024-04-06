
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../../utils/custom_widgets/build_appbar.dart';
import '../widgets/cart_info.dart';
import '../../../utils/custom_widgets/global_widgets/app_button.dart';
import '../widgets/payment_method_bottom_sheet.dart';
import '../widgets/total_price.dart';

class MyCart extends StatelessWidget {
   MyCart({key});
   double  total=Get.arguments;
   final double sum=Get.arguments+8;

   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController AddressController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(title: 'My Cart',SearchDisplay:false),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                    children: [
            SizedBox(height:5 ,),
            Expanded(child: Image.asset('assets/images/basket.png')),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: MediaQuery.of(context).size.width,
                        height:130 ,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Dear Proggrammer",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(context: context,
                                          builder: (context)=> Dialog(
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Form(
                                                key: formKey,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text('Change Data',style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16
                                                    ),),
                                                    SizedBox(height: 20.h,),
                                                    TextFormField (
                                                        validator: (data)
                                                        {
                                                          if (data!.isEmpty)
                                                            return 'mobile is required';
                                                          else if(data!.length < 10)
                                                            return 'Invalid Phone number';
                                                          else if (data[0] != '1')
                                                            return 'Invalid Phone number';
                                                          else if (data[1] != '0' && data[1] != '1' && data[1] != '2' && data[1] != '5')
                                                            return 'Invalid Phone number';
                                                        },
                                                        keyboardType: TextInputType.phone,
                                                        controller: phoneNumberController,

                                                        decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons.phone),
                                                          prefixText: '+20',
                                                          //floatingLabelBehavior: FloatingLabelBehavior.always,
                                                          border:OutlineInputBorder(),
                                                          labelText: 'Phone Number',

                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: AppColors.blue,
                                                                width: 2.0),
                                                            borderRadius: BorderRadius.circular(8.0),
                                                          ),
                                                        ),
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(10),
                                                          FilteringTextInputFormatter.digitsOnly ,
                                                        ]
                                                    ),
                                                    SizedBox(height: 10.h,),
                                                    TextFormField (
                                                        validator: (data)
                                                        {
                                                          if(data!.isEmpty)
                                                            return 'Address is required' ;
                                                        },
                                                        keyboardType: TextInputType.streetAddress,

                                                        controller: AddressController,
                                                        decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons.location_on),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: AppColors.blue,
                                                                width: 2.0),
                                                            borderRadius: BorderRadius.circular(8.0),
                                                          ),
                                                          //floatingLabelBehavior: FloatingLabelBehavior.always,
                                                          border:OutlineInputBorder(),
                                                          labelText: 'Address',

                                                        ),
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(50),
                                                        ]
                                                    ),
                                                    //address
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                    },
                                    child:Text("Change",
                                      style: TextStyle(fontSize: 18,
                                        color: Color(0xFFDB3022),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text("mohamed hossam,01158814259,3 Newbdidge court",
                                style: TextStyle(
                                    fontSize: 16),
                              ),
                              Text("Chino Hills, CA,97545,United State",
                                style: TextStyle(
                                    fontSize: 16
                                ),),
                            ],
                          ),
                        ),
                      ),
            SizedBox(height:20 ,),
                      OrderInfoItem(
              title: 'Order Subtotal',
              value: '$total EGP',
            ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Discount',
                        value: r'0 EGP',
                      ),
                      SizedBox(height:3 ,),
                      OrderInfoItem(
                        title: 'Shipping',
                        value: r'8 EGP',
                      ),
                      SizedBox(height:17 ,),
                      Divider(
                        thickness: 2,
                        height: 34,
                        color: Color(0xFFC6C6C6),
                      ),
                      Total_price(

                        price: '$sum EGP',

                      ),
                      SizedBox(height:16 ,),
                      buttonWidget(
                        text: 'Complete Payment',
                        width: 350,
                        height: 73,
                        radius: 15,
                        onPress: () {
                         Get.bottomSheet(

                                  PaymentMethodsBottomSheet(),
                           settings: RouteSettings(arguments:sum),

                              );
                        },
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: AppColors.white,
                        conColor: AppColors.orange,


                      ),
                      SizedBox(height:60 ,),

                  ],
                ),
          ),
    );
  }


}









