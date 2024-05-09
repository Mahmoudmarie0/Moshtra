
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';
import '../../../models/cart_model.dart';
import '../../../utils/custom_widgets/build_appbar.dart';
import '../../../utils/custom_widgets/global_widgets/products_ListView.dart';
import '../../auth/register/controller/controller.dart';
import '../controller/controller.dart';
import '../widgets/cart_info.dart';
import '../../../utils/custom_widgets/global_widgets/app_button.dart';
import '../widgets/payment_method_bottom_sheet.dart';
import '../widgets/total_price.dart';


class MyCart extends StatelessWidget {
   // MyCart({key});
   dynamic  total=Get.arguments;
   final dynamic sum=Get.arguments+ 8;
   List<ProductModel> products ;
   MyCart(this.products);

   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController AddressController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey();
   RegisterController registerController=Get.put(RegisterController());


   @override
  Widget build(BuildContext context) {
    return  GetBuilder<PaymentController>(
              init: PaymentController(),
              builder: (controller)=>
              controller.loading.value ? Center(child: CircularProgressIndicator())

      :Scaffold(
        backgroundColor: AppColors.white,
        appBar: buildAppBar(title: 'My Cart'.tr,SearchDisplay:false),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                          children: [
                    SizedBox(height:5 ,),
                  // Expanded(child: Image.asset('assets/images/basket.png')),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                              width: MediaQuery.of(context).size.width,
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
                                        Text("Dear Customer".tr,
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),
                                        TextButton(
                                          onPressed: () {
                                            phoneNumberController.text = controller.userModel!.phoneNumber;
                                            AddressController.text = controller.userModel!.address;
                                            showDialog(context: context,
                                                builder: (context)=> Dialog(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(16),
                                                    child: Form(
                                                      key: formKey,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text('Change Data'.tr,style: TextStyle(
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
                                                                labelText: 'Phone Number'.tr,
                  
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
                                                                suffixIcon: GestureDetector(
                                                                  onTap: ()async
                                                                  {
                                                                    AddressController.text = await registerController.getCurrentLocation();
                                                                  },
                                                                    child: Icon(Icons.location_on)),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: AppColors.blue,
                                                                      width: 2.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                //floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                border:OutlineInputBorder(),
                                                                labelText: 'Address'.tr,
                  
                                                              ),
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(50),
                                                              ]
                                                          ),
                                                          SizedBox(height: 10.h,),//address
                                                          Align(
                                                            alignment: Alignment.bottomRight,
                                                            child: TextButton(onPressed: ()
                                                            {
                                                              if (formKey.currentState!.validate())
                                                              {
                                                                controller.phone = phoneNumberController.text;
                                                                controller.address = AddressController.text;
                                                                Navigator.pop(context);
                                                              }
                  
                                                              },
                                                              child: Text('Submit'.tr),),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            );
                                          },
                                          child:Text("Change".tr,
                                            style: TextStyle(fontSize: 18,
                                              color: Color(0xFFDB3022),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(text: 'Name: '.tr, fontweight: FontWeight.w400,),
                                        CustomText(text: controller.userModel!.name, fontweight: FontWeight.w400,)
                  
                                      ],
                                    ),
                                    SizedBox(height:5.h,),
                                    Row(
                                      children: [
                                        CustomText(text: 'Email: '.tr, fontweight: FontWeight.w400,),
                                        CustomText(text: controller.userModel!.email, fontweight: FontWeight.w400,)
                                      ],
                                    ),
                                    SizedBox(height: 5.h,),
                                    Row(
                                      children: [
                                        CustomText(text: 'Phone number: 0'.tr,fontweight: FontWeight.w400,),
                                        CustomText(text: controller.phone.toString(),fontweight: FontWeight.w400,)
                                      ],
                                    ),
                                    SizedBox(height: 5.h,),
                                    Row(
                                      children: [
                                        CustomText(text: 'Address: '.tr,fontweight: FontWeight.w400,),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                              child: CustomText(text: controller.address.toString(),fontweight: FontWeight.w400,)),
                                        )
                                      ],
                                    )
                  
                                  ],
                                ),
                              ),
                            ), //information card
                  SizedBox(height:20 ,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cart List'.tr ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                GestureDetector(
                                  onTap: (){Get.back();},
                                  child: Text('Edit'.tr ,style: TextStyle(fontSize: 18,
                                    color: Color(0xFFDB3022),
                                  ),),
                                ),
                              ],
                            ),
                            productsList(products),//horizontal Product List
                            OrderInfoItem(
                    title: 'Order Subtotal'.tr,
                    value: '$total EGP',
                  ),
                            SizedBox(height:3 ,),
                            OrderInfoItem(
                              title: 'Discount'.tr,
                              value: r'0 EGP',
                            ),
                            SizedBox(height:3 ,),
                            OrderInfoItem(
                              title: 'Shipping'.tr,
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
                              text: 'Complete Payment'.tr,
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
              ],
            ),
          ),
    )
    );
  }


}









