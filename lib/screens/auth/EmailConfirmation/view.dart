import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/components.dart';
import 'controller/controller.dart';

class EmailConfirmation extends StatefulWidget {

  @override
  State<EmailConfirmation> createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  TextEditingController confirmationController = TextEditingController();

  EmailConfirmationController emailConfirmation = Get.put(EmailConfirmationController());

  final _confirmationController = TextEditingController();



  void dispose(){
    _confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: AppColors.blue,
      body: Container(
        // alignment: Alignment.center,
        // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(AssetsPaths.Ellipse)
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 26,top: 112),
                //   child: Text("Confirmation\nEmail",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 48.sp,color: AppColors.white),),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 30 , top: 112),
                  alignment: Alignment.centerLeft,
                  child: Text('Confirmation\nEmail' ,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                // SizedBox(width: 24.w,),


              ],


            ),

            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5 ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10 , bottom: 10 , top: 30),
                        child: Text(
                          'Enter your email address for verification.',
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        child: SizedBox(
                          child: TextFormField(
                            validator: (data)
                            {
                              if (data!.isEmpty)
                                return 'Please enter your e-mail';
                              return null;
                            },
                            controller: _confirmationController,
                            // obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email_sharp),

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
                            onPressed: () async {

                              if(formKey.currentState!.validate())
                              {
                                verifyEmail();
                              }
                            },
                            child: Text('Reset Your Password' ,
                              style: TextStyle(
                                color: AppColors.white,
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
            ),
          ],
        ),
      ),
    );

  }

  showSnackBarFun(context , String msg){
    SnackBar snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        // duration: Duration.millisecondsPerSecond.milliseconds,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        backgroundColor: AppColors.white,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 120,
            left: 15,
            right: 15
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // Icon(
                //   icon,
                //   color: AppColors.Green,
                // ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  msg,
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ],
        )

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }








  Future verifyEmail() async{
    QuerySnapshot users = await FirebaseFirestore.instance.collection("Users").get() as QuerySnapshot<Object?>;
    List<String> userEmails = [];

    for(int i = 0 ; i < users.size ; i++){
      userEmails.add(users.docs[i]['email']);
    }

    print('LengthOfEmails => ${userEmails.length}');


    if(userEmails.contains(_confirmationController.text.trim())){
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
          email: _confirmationController.text.trim());
      showSnackBarFun(context , 'Check Your Email');
    }else{
      showSnackBarFun(context, 'Invalid Email Address');
    }

    // try {
    //   await FirebaseAuth.instance
    //       .sendPasswordResetEmail(
    //       email: _confirmationController.text.trim());
    //   showSnackBarFun(context , 'Check Your Email');
    // }on FirebaseAuthException {
    //   showSnackBarFun(context, 'Invalid Email Address');
    // }
  }
}
