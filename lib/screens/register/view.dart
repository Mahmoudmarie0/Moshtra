import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/screens/login/view.dart';
import '../../utils/constants/assets.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          SizedBox(height: 110.h,),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text('Create an account',
                style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold),
              )
          ),
          Lable('Email'),
          userData('enter your email..'),
          Lable('Password'),
          pass('enter you password..'),
          Lable('Re-Enter Password'),
          pass('enter you password..'),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'I have read the ',
                        style:TextStyle(color: Color(0xffA4A5B4))
                        ,),
                    ),
                    Container(
                      child: Text(
                        'Privace Policy',
                        style: TextStyle(color: Color(0xff07AA83)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 22, right: 22, top: 30,bottom: 23),
            width: 331,
            child: TextButton(
              onPressed: (){print('Button is pressed');},
              child: Text(
                "GET STARTED",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom:12),
            child: Row(

              children: [
                Expanded(
                    child: Divider(
                      color: Color(0xff8B8C9F),
                      indent: 90,
                    )
                ),
                Text('or continue with'),
                Expanded(
                    child: Divider(
                      color: Color(0xff8B8C9F),
                      endIndent: 90,
                    ))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsPaths.Google),
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(AssetsPaths.Facebook),
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(AssetsPaths.Apple),





                ],


              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(
                    color: Color(0xffA4A5B4),
                    fontSize: 16
                ),),
              TextButton(onPressed: (){
                Get.to(()=>LoginScreen());

              }, child: Text(
                'SIGN IN',
                style: TextStyle(
                    color: Color(0xff07AA83),
                    fontSize: 16
                ),) ),




            ],
          ),
        ],
      ),
    );
  }

}

class Lable extends StatelessWidget {
  String lable;
  Lable(this.lable);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22),
      alignment: Alignment.centerLeft,
      child: Text(
        lable,
        style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }


}
class userData extends StatelessWidget {
  String hint;
  userData(this.hint);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 22,vertical: 16),
      child:Container(
        margin:EdgeInsets.symmetric(horizontal: 14,vertical: 12) ,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 12),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(51, 51, 51, 0.1),
      ),
    );

  }

}
class pass extends StatelessWidget {
  String hint;
  pass(this.hint);
  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 22,vertical: 16),
      child:Container(
        margin:EdgeInsets.symmetric(horizontal: 14,vertical: 12) ,
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 12),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(51, 51, 51, 0.1),
      ),
    );;
  }
}
