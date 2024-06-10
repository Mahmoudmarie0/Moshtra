import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/models/newFav_model.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

import '../../../models/fav_model.dart';
import '../../../utils/constants/assets.dart';
import '../../Home/controller/Controller.dart';
import '../../Home/view.dart';
import '../../Wishlist/view.dart';
import '../view.dart';
import 'controller/Controller.dart';


class SeeAll  extends StatefulWidget {
  List<ProductModel> products = [];
  String catName;
  SeeAll(this.products,this.catName);

  HomeController homeController = Get.put(HomeController(),permanent: true);

  @override
  State<SeeAll> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SeeAll> {

  List<QueryDocumentSnapshot> data = [];

  CollectionReference fav = FirebaseFirestore.instance.collection('favorites');


  bool isNotExist = true;

  bool? isSelected;

  int count = 1;

  String productId = "";

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('favorites')
        .get() as QuerySnapshot<Object?>;
    data = [];
    data.addAll(querySnapshot.docs);
    print('DataLength => ${data.length}');

    for (int i = 0; i < data.length; i++) {
      if (data[i]['userId'] == FirebaseAuth.instance.currentUser!.uid &&
          data[i]['product']['productId'] == productId) {
        ++count;
      }
    }

    if (count > 1) isNotExist = false;

    print('isExist => ${isNotExist}');
    print('Counter => ${count}');

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return widget.products.length != 0 ? GetBuilder<subcategoryController>(
      init: subcategoryController(),
      builder: (controller) =>
      controller.loading.value ? Center(child: CircularProgressIndicator())
          : Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: CustomText(
                    text: widget.catName,
                    fontSize: 18,
                    fontweight: FontWeight.w800,),
                ),
                SizedBox(height: 30.h,),
                GridViewElectronics(),
              ],
            ),
          ),
        ),
      ),
    ) :  buildEmptyScreen();
  }

  Widget GridViewElectronics() {
    return GetBuilder<subcategoryController>(
      builder: (controller) =>
          Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade50,
                  shape: BoxShape.rectangle
              ),
              height: 700.h,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1/1.20,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0.5,

                ),

                itemCount: widget.products.length,

                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width*.4,
                    child: Stack(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap:() {
                                  widget.homeController.addHistory(widget.products[index]);
                                  Get.to(DetailsScreen(widget.products[index]));
                                },
                                child:  Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width*.4,
                                  height: 135.h,

                                  child: Container(
                                    height:138.h,
                                    width: 160.w,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image .network(widget.products[index].image as String),
                                  ),
                                ),
                              ),
                              SizedBox(height: 9.h,),
                              CustomText(text:Get.locale?.languageCode=="en"? widget.products[index].nameEN as String:widget.products[index].nameAR as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, maxLine: 1,),
                              SizedBox(height: 5.h,),
                              CustomText(text:Get.locale?.languageCode=="en"? widget.products[index].sub_descriptionEN as String:widget.products[index].sub_descriptionAR as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                              SizedBox(height: 5.h,),
                              CustomText(text: widget.products[index].price.toString()+' EGP',color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                            ],
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
                              builder: (context , snapshot) {
                                List<String> productIds = [];
                                if(!snapshot.hasData){
                                  return CircularProgressIndicator();
                                }
                                else {
                                  List<new_fav> favList = [];
                                  for (int i = 0; i <
                                      snapshot.data!.docs.length; i++) {
                                    if (snapshot.data!.docs[i].get('userId') ==
                                        FirebaseAuth.instance.currentUser!.uid) {
                                      favList.add(
                                          new_fav.fromSnapshot(snapshot.data!.docs[i]));
                                      productIds.add(
                                          snapshot.data!.docs[i]['product']['productId']);
                                    }
                                  }
                                }

                                return Container(
                                  padding: EdgeInsets.only(left: 115 , bottom: 170),
                                  child: MaterialButton(
                                    onPressed: () async{

                                      productId = widget.products[index].productId!;
                                      await getData();

                                      if(isNotExist) {
                                        fav.add({
                                          'product': widget.products[index].toJson(),
                                          'createdAt': DateTime.now(),
                                          'userId': FirebaseAuth.instance.currentUser!.uid.toString()
                                        });

                                        showSnackBarFun(context , 'The product has been added to\nyour Favorite');
                                        count = 1;
                                        isNotExist = true;
                                      }else{

                                        print(' ProIndexFromModel => ${widget.products[index].productId}');

                                        for (int i = 0;
                                        i < snapshot.data!.docs.length;
                                        i++) {
                                          if (snapshot.data!.docs[i]
                                              .get('userId') ==
                                              FirebaseAuth.instance
                                                  .currentUser!.uid &&
                                              snapshot.data!
                                                  .docs[i]['product']['productId'] ==
                                                  widget.products[index]
                                                      .productId) {
                                            fav
                                                .doc(snapshot.data!.docs[i].id)
                                                .delete();
                                            print(
                                                'DocID => ${snapshot.data!.docs[i].id}');
                                            print(
                                                'ProductID (snapshot) => ${snapshot.data!.docs[i]['product']['productId']}');
                                            print(
                                                'ProductID (model) => ${widget.products[index].productId}');
                                          }
                                        }

                                        showSnackBarFun(context , 'The product has been deleted\nfrom your Favorite');
                                        count = 1;
                                        isNotExist = true;
                                      }
                                    },
                                    child: productIds.length == 0 ? Center(child: Icon(Icons.favorite_border)) : productIds.contains(widget.products[index].productId) ? Center(child: Icon(Icons.favorite)) : Center(child: Icon(Icons.favorite_border)),
                                    textColor: Colors.red,
                                  ),
                                );
                              }
                          ),
                        ]
                    ),
                  );
                },

              )
          ),
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
                  //'The product has been added to\nyour Favorite',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            Expanded(
              child: GestureDetector(
                child: Text('View Favorite'
                  ,style: TextStyle(
                      color: AppColors.orange
                  ),
                ),
                onTap: (){ Get.to(MyFavScreen()); },
              ),
            )
          ],
        )

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildEmptyScreen() {
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.CartListEmpty
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("The Product Is Not Available",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "The Product Is Not Available Right Now. You Can Explore Our Top Categories",

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff6F7384),
                    height: 1.55,
                  ),
                ),
              ),
              ElevatedButton(

                  onPressed: () {
                    // homeLayoutController!.SeeAll();
                    Get.off(CategoriesScreen());
                    // Get.to(CategoriesScreen(),transition: Transition.upToDown);
                    // Go To Categories
                  },
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      minimumSize: Size(328, 60),
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      )
                  ),
                  child: Text(
                    "Explore Categories",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
              ),
            ]
        ),
      ),
    );
  }



}
