import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:moshtra/models/cart_product_model.dart';
import 'package:moshtra/screens/MyCart/database/cart_view_model.dart';
import 'package:moshtra/screens/checkout/OrderSuccess.dart';
import 'package:moshtra/screens/checkout/Order_Confirm_Screen.dart';
import 'package:moshtra/screens/checkout/Order_Confirm_Screen.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/constants/components.dart';
class ShippingAdress extends StatelessWidget {
  //const ShippingAdress({super.key});

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController FullNameController = TextEditingController();
  final TextEditingController AdressController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  final TextEditingController StateController = TextEditingController();
  final TextEditingController ZipCodeController = TextEditingController();
  final TextEditingController CountryController = TextEditingController();





  // bool isValidEgyptianNumber(String input) {
  //   RegExp regex = RegExp(r'^\+20[0-9]{10}$');
  //   return regex.hasMatch(input);
  // }

  // bool isValidEgyptianNumber(String input) {
  //   RegExp regex = RegExp(r'^[0-9]{10}$');
  //   return regex.hasMatch(input);
  // }


  void check(){
    String PhoneNumber=phoneNumberController.text;
    String FullName=FullNameController.text;
    String Adress=AdressController.text;
    String City=CityController.text;
    String State=StateController.text;
    String ZipCode=ZipCodeController.text;
    String Country=CountryController.text;

if(PhoneNumber.isEmpty||FullName.isEmpty||Adress.isEmpty||City.isEmpty||State.isEmpty||ZipCode.isEmpty||Country.isEmpty){
  GetSnackbarError( message: "Please Enter All Fields",Color: AppColors.Red);
}
else if(PhoneNumber.length!=10){

  GetSnackbarError( message: "Enter correct phone number",Color: AppColors.Red);
}
else{
  Get.to(OrderConfirmScreen());

}
  }






  // String ?validateAndSubmit() {
  //   String phoneNumber = phoneNumberController.text.trim();
  //   if (isValidEgyptianNumber(phoneNumber)) {
  //
  //     return('Valid Egyptian Phone Number: $phoneNumber');
  //   }
  //
  //
  //
  //
  //   else {
  //
  //     print('Invalid Egyptian Phone Number: $phoneNumber');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipping Adress"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 5),
                TextField(
                    controller: FullNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                  ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ]
                ),
                SizedBox(height: 15),
                TextFormField(

                  controller: phoneNumberController,


                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile Number",
                    prefixText: '+20',

                  ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly ,
                    ]
                 // maxLength: 12,

                ),
                SizedBox(height: 15),
                TextField(
                    controller: AdressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adress",
                  ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(40),
                    ]
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                    controller: CityController,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: "City",
                  ),

                  inputFormatters: <TextInputFormatter>[

                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                LengthLimitingTextInputFormatter(12),
                  ],

                ),
                SizedBox(height: 15),
                TextField(
                    controller: StateController,


                  decoration: InputDecoration(


                    border: OutlineInputBorder(),
                    labelText: "State/Region",

                  ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      LengthLimitingTextInputFormatter(7),
                    ]
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ZipCodeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // O
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Zip Code(Postal Code)",

                  ),
                  maxLength: 5,
                ),
                SizedBox(height: 15),

                TextFormField(
                  controller: CountryController,



                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: "Country",



                  //  prefixText: "Egypt",
                  ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      LengthLimitingTextInputFormatter(15),
                    ]

                ),
                SizedBox(height: 25.h,),
                GetBuilder<CartViewModel>(
                  builder:(controller) => ElevatedButton(
                    onPressed: (){
                      check();


                    },
                    child: Text('Add Address',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        minimumSize: Size(150, 50),
                        backgroundColor: Color(0xfff88160),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}































// import 'package:flutter/material.dart';
// class Summary extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[
//           Container(
//             child: Text(
//               "Summary",
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }