import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/cart_product_model.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Home/view.dart';
import 'package:moshtra/screens/Home_layout/view.dart';
import 'package:moshtra/screens/MyCart/database/cart_view_model.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/comment_model.dart';


import '../MyCart/view.dart';
import 'Components/ChatBubble.dart';
import 'Components/Details_Tabs.dart';
import 'controller/controller.dart';

class DetailsScreen extends StatefulWidget {
  ProductModel model;



  DetailsScreen(this.model);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final controller = ScrollController();
  CollectionReference messages =
        FirebaseFirestore.instance
            .collection('Messages');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController comment = TextEditingController();
  bool? first = true;
  bool? second = false;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt',descending: true).snapshots(),
        builder: (context,snapshot)
        {

          if(snapshot.hasData)
          {
            List<Comment> commentList = [];
            for(int i = 0; i < snapshot.data!.docs.length; i++)
              {
                if(snapshot.data!.docs[i]['productID'] == widget.model.productId)
                  commentList.add(Comment.fromJson(snapshot.data!.docs[i]));
              }
            return Scaffold(
                backgroundColor: AppColors.white,
                body: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white
                            ),
                            height: 250.h,
                            width: double.infinity,
                            child: Stack(
                                alignment: Alignment.center,
                                children:[
                                  Image.network(
                                    widget.model.image as String,
                                    fit: BoxFit.contain,
                                    width: 360.w,
                                    height: 290.h ,
                                  ),
                                  Positioned(
                                      top: 50,
                                      left: 20,
                                      child: GestureDetector(
                                          onTap: (){
                                            Get.to(HomeLayout());
                                          },
                                          child: Icon(Icons.arrow_back_ios))),

                                ]
                            ),
                          ),//Image Container
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                              color: Colors.white,
                            ),
                            width: double.infinity,
                            height: 450,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TabBar(
                                    indicatorColor: Colors.transparent,

                                    onTap: (index)
                                    {
                                      if (index == 0)
                                      {
                                          first = true;
                                          second = false;
                                          setState(() {
                                          });
                                      }
                                      else
                                      {

                                        first = false;
                                        second = true;
                                        setState(() {

                                        });
                                      }
                                    },
                                      tabs: [
                                    TabItem('Details',first!),
                                    TabItem('Comments',second!),
                                      ]
                                  ),
                                  Expanded(
                                    child: TabBarView(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 24, right: 6),
                                                width: 62.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff1f8bda),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Center(
                                                  child: Text('Top Rated',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 24),
                                                width: 81.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.green,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Center(
                                                  child: Text('Free Shipping',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 10,
                                                      color: Colors.white,

                                                    ),),
                                                ),
                                              ),



                                            ],
                                          ),
                                          SizedBox(height: 6.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(widget.model.name as String ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                ), ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text('${widget.model.price as String} EGP',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.w600,
                                                    ),)
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15.h,),
                                          Text('Details:' ,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),),
                                          SizedBox(height: 10.h,),
                                          Text(
                                            widget.model.description as String,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,),

                                          ),
                                          Spacer(),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: MediaQuery.of(context).size.width * .4,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: Colors.grey),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Text('Size',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w600
                                                        ),),
                                                      Text(widget.model.Sized as String,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: MediaQuery.of(context).size.width * .4,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: Colors.grey),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Text('Color',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),),
                                                      Container(

                                                        width: 30,
                                                        height: 20,
                                                        padding: EdgeInsets.all(12),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.grey),
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: widget.model.color
                                                        ),

                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          //-----------------------------------
                                        ],
                                      ),
                                      Column(
                                        children: [

                                          Expanded(child:
                                          ListView.builder(
                                              controller: controller,
                                              itemCount: commentList.length,
                                              itemBuilder: (context,index)
                                              {
                                                return ChatBubble(comment: commentList[index],);
                                              })
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: TextField(
                                              // onSubmitted: (data)
                                              // {
                                              //   messages.add({
                                              //     'message' : data
                                              //   });
                                              //   comment.clear();
                                              // },
                                              controller: comment,
                                              maxLines: null,
                                              keyboardType: TextInputType.multiline,
                                              decoration: InputDecoration(
                                                hintText: 'Write a comment...',
                                                suffixIcon: GestureDetector(
                                                    onTap: ()
                                                    {
                                                      messages.add(
                                                          {
                                                            'message' : comment.text,
                                                            'createdAt': DateTime.now(),
                                                            'userID' : userId,
                                                            'productID' : widget.model.productId
                                                          }
                                                      );
                                                      comment.clear();
                                                      controller.animateTo(
                                                          controller.position.minScrollExtent,
                                                          duration: Duration(seconds: 1),
                                                          curve: Curves.fastOutSlowIn
                                                      );
                                                    },
                                                    child: Icon(Icons.send,color: Colors.blue,)),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                  borderSide: BorderSide(color: Colors.blue),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(16),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue
                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),//details container

                        ],
                      ),
                    ), //Product Details
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 160.w,
                              child: ElevatedButton(onPressed: (){},
                                child: Text('Buy Now', style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.grey5,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w,),
                            Container(
                              width: 160.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.orange
                              ),
                              child: GetBuilder<CartViewModel>(
                                init: Get.put(CartViewModel()),
                                builder: (controller) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: (){
                                        controller.addProduct(
                                            CartProductModel(
                                                name: widget.model.name,
                                                price: widget.model.price,
                                                quantity: 1,
                                                image: widget.model.image,
                                                productId: widget.model.productId
                                            )
                                        );
                                        showSnackBarFun(context);
                                      },
                                      child: Text('Add To Cart',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(AssetsPaths.MyCartWhite),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )//Buy button
                  ],
                )
            );
          }
          else
          {
            return Text('Loading...');
          }
        },
      ),
    );
  }

  showSnackBarFun(context){
    SnackBar snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        duration: Duration.millisecondsPerSecond.milliseconds,
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
                Icon(
                  Icons.task_alt_rounded,
                  color: AppColors.Green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'The product has been added to\nyour cart',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            GestureDetector(
              child: Text('View Cart'
                ,style: TextStyle(
                    color: AppColors.orange
                ),
              ),
              onTap: (){ Get.to(MyCartScreen()); },
            )
          ],
        )

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
