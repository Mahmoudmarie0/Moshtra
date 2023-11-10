import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/components.dart';
import 'controller/controller.dart';

class EmailConfirmation extends StatelessWidget {

  TextEditingController confirmationController = TextEditingController();
  EmailConfirmationController emailConfirmation = Get.put(EmailConfirmationController());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: AppColors.blue,
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AssetsPaths.Ellipse)
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text('Confirmation\nEmail' ,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10 , bottom: 10 , top: 30),
                        child: Text(
                          'Enter your email address for verification.',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        child: SizedBox(
                          child: TextFormField(
                            controller: confirmationController,
                            // obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email_sharp),
                              // suffixIconColor: Color(0xff037eee),
                              // enabledBorder: OutlineInputBorder(
                              //
                              //   borderSide: BorderSide(
                              //     width: 1,
                              //     // color: Color(0xfff88160)
                              //   ),
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',

                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {

                              String email = confirmationController.text;
                              emailConfirmation.validateEmail(email);
                            },
                            child: Text('Confirm' ,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: button,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}