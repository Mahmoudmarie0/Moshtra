import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moshtra/screens/paswword_created_success/view.dart';
import 'package:moshtra/screens/register/view.dart';


class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50 , bottom: 12),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Home());
                            },
                            child: Icon(Icons.arrow_back,
                              size: 32,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text('Create Password',
                              style: TextStyle(
                                  fontSize: 14
                              ),),
                          ),

                        ],
                      )
                  ),
                  Expanded(

                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '03/',
                            style: TextStyle(
                                fontSize: 14),),
                          Text(
                            '03',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffC0C0C0)
                            ),)
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    'New Password',
                    style: TextStyle(
                      fontSize:24,
                      fontWeight: FontWeight.bold,
                    ),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text(
                    'Enter your new password and remember it.',
                    style: TextStyle(
                        color: Color(0xff6F7384)
                    ),)
                ],
              ),),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Lable('Password'),
                  Text(' *',style: TextStyle(color: Colors.red),)
                ],
              ),
            ),
            userData('Enter Your Password'),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Lable('Confirm Password'),
                  Text(' *',style: TextStyle(color: Colors.red),)
                ],
              ),
            ),
            userData('Enter Your Password'),
            Container(
              margin: EdgeInsets.only(left: 22, right: 22, top: 30,bottom: 23),
              width: 331,
              child: TextButton(
                onPressed: (){
                  Get.to(CreatPasswordSuccesfully());
                },
                child: Text(
                  "Save",
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



          ],
        ),
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
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold),),
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