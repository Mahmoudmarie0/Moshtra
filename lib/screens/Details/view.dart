import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Home/view.dart';
import 'package:moshtra/screens/Home_layout/view.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshtra/models/comment_model.dart';


import '../../models/cart_model.dart';
import '../../models/newCart_model.dart';
import '../../utils/custom_widgets/global_widgets/products_ListView.dart';
import '../Home/controller/Controller.dart';
import '../MyCart/view.dart';
import '../Payment/myCartPayment/view.dart';
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

  List<QueryDocumentSnapshot> data = [];

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  bool isNotExist = true;
  int count = 1;




  final ScrollController _scrollController = ScrollController();



  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('cart').get() as QuerySnapshot<Object?>;
    data = [];
    data.addAll(querySnapshot.docs);
    print('DataLength => ${data.length}');

    for(int i = 0 ; i < data.length ; i++){
      if(data[i]['userId'] == FirebaseAuth.instance.currentUser!.uid && data[i]['product']['productId'] == widget.model.productId){
        count++;
      }
    }

    if(count > 1)
      isNotExist = false;

    print('isExist => ${isNotExist}');
    print('Counter => ${count}');

    setState(() {});
  }


  @override
  void initState(){
    getData();
    super.initState();
  }


  final controller = ScrollController();
  HomeController homeController = Get.put(HomeController());


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
                      child: SingleChildScrollView(
                          controller: _scrollController,
                        child: Column(
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
                                              Get.back();
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
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Color.fromRGBO(240, 241, 245, 1),
                                        ),
                                        width: MediaQuery.of(context).size.width * .9,
                                        child: TabBar(
                                            dividerColor: Colors.transparent,
                                            indicatorColor: Colors.transparent,
                                            indicator: BoxDecoration(),

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
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(children: [
                                        ProductDetails(),
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
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                minHeight: 30, // Set minimum height
                                                maxHeight: 200, // Set maximum height
                                              ),
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
                                                  hintText: 'Write a comment...'.tr,
                                                  suffixIcon: GestureDetector(
                                                      onTap: ()
                                                      {
                                                        if(comment.text.trim().isNotEmpty){
                                                          messages.add(
                                                              {
                                                                'message' : comment.text,
                                                                'createdAt': DateTime.now(),
                                                                'userID' : userId,
                                                                'productID' : widget.model.productId
                                                              }
                                                          );
                                                        }
                                              
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
                            ),

                            // Container(color: Colors.red,height: 600,)//details container
                            SizedBox(height: 10.h,),

                            GetBuilder<DetailsController>(
                              init: DetailsController(widget.model!.type!),
                              builder: (controller) {
                                if(controller.loading.value)
                                {
                                  return Center(child: CircularProgressIndicator());
                                }
                                else
                                {
                                  if(controller.CatModel!.product.isNotEmpty)
                                  {
                                    return Container(
                                      height: 300.h,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Related Products'.tr ,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              itemCount:controller.CatModel!.product.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context,index)
                                              {
                                                return Container(
                                                  width: 150.w,
                                                  child: Column(
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: GestureDetector(
                                                          onTap:(){
                                                            homeController.addHistory(controller.CatModel!.product[index]);
                                                            widget.model = controller.CatModel!.product[index];

                                                            setState(() {
                                                              _scrollController.animateTo(
                                                                0.0,
                                                                duration: Duration(milliseconds: 250),
                                                                curve: Curves.easeIn,
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12),
                                                              color: AppColors.white,
                                                            ),
                                                            height: 200.h,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Image.network(controller.CatModel!.product[index]!.image!),

                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(height: 1.h,),
                                                      CustomText(text:Get.locale?.languageCode == "en"? controller.CatModel!.product[index].nameEN as String : controller.EgCatModel!.product[index].nameAR as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                                                      SizedBox(height: 5.h,),
                                                      CustomText(text:Get.locale?.languageCode == "en"? controller.CatModel!.product[index].sub_descriptionEN as String : controller.CatModel!.product[index].sub_descriptionAR as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                                                      SizedBox(height: 5.h,),
                                                      CustomText(text: controller.CatModel!.product[index].price.toString()+' EGP',color:AppColors.blue,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                                                    ],
                                                  ),
                                                );
                                              }, separatorBuilder: (context, index) { return SizedBox(width: 20.w,);},),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else
                                    return Container();
                                }
                              }
                            ),

                            SizedBox(height: 10.h,),
                            GetBuilder<DetailsController>(
                              init: DetailsController(widget.model!.type!),
                              builder: (controller)
                              {
                                if(controller.loading.value){
                                  return Center(child: CircularProgressIndicator());
                                }
                                else
                                {
                                  if(controller.EgCatModel!.product.isNotEmpty)
                                  {

                                    return Container(
                                      height: 300.h,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Related Egyptian products'.tr ,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              itemCount:controller.EgCatModel!.product.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context,index)
                                              {
                                                return Container(
                                                  width: 150.w,
                                                  child: Column(
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: GestureDetector(
                                                          onTap:(){
                                                            homeController.addHistory(controller.EgCatModel!.product[index]);
                                                            widget.model = controller.EgCatModel!.product[index];

                                                            setState(() {
                                                              _scrollController.animateTo(
                                                                0.0,
                                                                duration: Duration(milliseconds: 250),
                                                                curve: Curves.easeIn,
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12),
                                                              color: AppColors.white,
                                                            ),
                                                            height: 200.h,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Image.network(controller.EgCatModel!.product[index]!.image!),

                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(height: 1.h,),
                                                      CustomText(text:Get.locale?.languageCode == "en"? controller.EgCatModel!.product[index].nameEN as String : controller.EgCatModel!.product[index].nameAR as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                                                      SizedBox(height: 5.h,),
                                                      CustomText(text:Get.locale?.languageCode == "en"? controller.EgCatModel!.product[index].sub_descriptionEN as String : controller.EgCatModel!.product[index].sub_descriptionAR as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                                                      SizedBox(height: 5.h,),
                                                      CustomText(text: controller.EgCatModel!.product[index].price.toString()+' EGP',color:AppColors.blue,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                                                    ],
                                                  ),
                                                );
                                              }, separatorBuilder: (context, index) { return SizedBox(width: 20.w,);},),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else
                                    return Container();
                                }
                              }
                            ),
                          ],
                        ),
                      ),
                    ), //Product Details
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Opacity(
                        opacity: widget.model.quantity == '0' ? 0.5 : 1,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60.h,
                                width: 160.w,
                                child: widget.model.quantity == '0' ?
                                ElevatedButton(onPressed: null,
                                  child: Text('Buy Now'.tr, style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.grey5,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                                  ),
                                )

                                    :ElevatedButton(onPressed: (){
                                      List<new_cart> cartList = [];
                                      List<ProductModel> products = [];

                                      cartList.add(new_cart(widget.model, '1',FirebaseAuth.instance.currentUser!.uid.toString()));
                                      products.add(widget.model);
                                      Get.to(() => MyCart(products, int.parse(widget.model.price as String), cartList, 'buy'));


                                },
                                      child: Text('Buy Now'.tr, style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
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

                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('cart').snapshots(),
                                  builder: (context , snapshot) {
                                    if(!snapshot.hasData){
                                      return Text("");
                                    }else {
                                      List<new_cart> cartList = [];
                                      for (int i = 0; i <
                                          snapshot.data!.docs.length; i++) {
                                        if (snapshot.data!.docs[i].get(
                                            'userId') ==
                                            FirebaseAuth.instance.currentUser!
                                                .uid) {
                                          cartList.add(new_cart.fromSnapshot(
                                              snapshot.data!.docs[i]));
                                        }
                                      }
                                    }
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        widget.model.quantity == '0' ? MaterialButton( onPressed: null,child: Text('Add To Cart'.tr),)  :
                                        MaterialButton(
                                          onPressed: () async{
                                            await getData();

                                            if(isNotExist) {
                                              cart.add({
                                                'product':widget.model.toJson(),
                                                'quantity': 1.toString(),
                                                'createdAt': DateTime.now(),
                                                'userId': FirebaseAuth.instance.currentUser!.uid.toString()
                                              });

                                              showSnackBarFun(context , 'The product has been added to\nyour cart'.tr);
                                              count = 1;
                                              isNotExist = true;
                                            }else{
                                              showSnackBarFun(context , 'The product already existed'.tr);
                                              count = 1;
                                              isNotExist = true;
                                            }

                                          },
                                          child: Text('Add To Cart'.tr,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                        SvgPicture.asset(AssetsPaths.MyCartWhite),
                                      ],
                                    );},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )//Buy button
                  ],
                )
            );
          }
          else
          {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget ProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             GetBuilder<DetailsController>(
               init: DetailsController(widget.model!.type.toString()),
               builder: (controller)=>controller.loading.value
               ?Container()
               : int.parse(widget.model!.number_of_order as String) >= controller.med ?Container(
                 margin: EdgeInsets.only(top: 24, right: 6),
                 width: 62.w,
                 height: 24.h,
                 decoration: BoxDecoration(
                     color: Color(0xff1f8bda),
                     borderRadius: BorderRadius.circular(8)
                 ),
                 child: Center(
                   child: Text('Best Sellers'.tr,
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 10,
                         color: Colors.white,
                       )
                   ),
                 ),
               ): Container()
             ),
            Container(
              margin: EdgeInsets.only(top: 24),
              width: 81.w,
              height: 24.h,
              decoration: BoxDecoration(
                  color: widget.model.quantity == '0' ? Colors.red : AppColors.green,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Text(widget.model.quantity == '0' ? 'Out Of Stock'.tr : 'Free Shipping'.tr,
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
            Expanded(
              child: Text( Get.locale?.languageCode=="en"? widget.model.nameEN as String: widget.model.nameAR as String ,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ), ),
            ),
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
        Text('Details:'.tr ,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),),
        SizedBox(height: 10.h,),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              Get.locale?.languageCode=="en"?  widget.model.descriptionEN as String: widget.model.descriptionAR as String,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,),

            ),
          ),
        ),
        SizedBox(height: 10.h,),
        // Spacer(),
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
                    Text('Size'.tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),
                    SizedBox(width: 24,),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(widget.model.Sized as String,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    ),
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
                    Text('Color'.tr,
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
    );
  }

  showSnackBarFun(context , String msg){
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
                  msg,
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            Expanded(
              child: GestureDetector(
                child: Text('View Cart'.tr
                  ,style: TextStyle(
                      color: AppColors.orange
                  ),
                ),
                onTap: (){ Get.to(MyCartScreen()); },
              ),
            )
          ],
        )

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
