import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Categories/Electronic/controller/Controller.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

import '../../../models/fav_model.dart';
import '../../Wishlist/view.dart';


class ElectronicsScreen  extends StatefulWidget {
  List<ProductModel> products = [];
  String catName;
  ElectronicsScreen(this.products,this.catName);

  @override
  State<ElectronicsScreen> createState() => _ElectronicsScreenState();
}

class _ElectronicsScreenState extends State<ElectronicsScreen> {

  List<QueryDocumentSnapshot> data = [];

  CollectionReference fav = FirebaseFirestore.instance.collection('favorites');

  bool isNotExist = true;

  bool? isSelected;

  int count = 1;

  String productId = "";

  getData() async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favorites').get() as QuerySnapshot<Object?>;
    data = [];
    data.addAll(querySnapshot.docs);
    print('DataLength => ${data.length}');


    for(int i = 0 ; i < data.length ; i++){
      if(data[i]['userId'] == FirebaseAuth.instance.currentUser!.uid && data[i]['productId'] == productId ){
        ++count;
      }
    }

    if(count > 1)
      isNotExist = false;

    print('isExist => ${isNotExist}');
    print('Counter => ${count}');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectronicsController>(
      init: ElectronicsController(),
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
    );
  }

  Widget GridViewElectronics() {
    return GetBuilder<ElectronicsController>(
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
                              CustomText(text: widget.products[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, maxLine: 1,),
                              SizedBox(height: 5.h,),
                              CustomText(text: widget.products[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
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
                                  List<Fav> favList = [];
                                  for (int i = 0; i <
                                      snapshot.data!.docs.length; i++) {
                                    if (snapshot.data!.docs[i].get('userId') ==
                                        FirebaseAuth.instance.currentUser!.uid) {
                                      favList.add(
                                          Fav.fromJson(snapshot.data!.docs[i]));
                                      productIds.add(
                                          snapshot.data!.docs[i].get('productId'));
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
                                          'image': widget.products[index].image,
                                          'name': widget.products[index].name,
                                          'price': widget.products[index].price,
                                          'productId': widget.products[index].productId,
                                          'userId': FirebaseAuth.instance.currentUser!.uid.toString(),
                                          'createdAt': DateTime.now(),
                                          'description': widget.products[index].description,
                                          'sub_description': widget.products[index].sub_description,
                                          'Sized': widget.products[index].Sized,
                                          'color': '#${widget.products[index].color!.value.toRadixString(16).substring(2)}',                                        });

                                        showSnackBarFun(context , 'The product has been added to\nyour Favorite');
                                        count = 1;
                                        isNotExist = true;
                                      }else{

                                        print(' ProIndexFromModel => ${widget.products[index].productId}');

                                        for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                                          if(snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid &&
                                              snapshot.data!.docs[i].get('productId') == widget.products[index].productId){
                                            fav.doc(snapshot.data!.docs[i].id).delete();
                                            print('DocID => ${snapshot.data!.docs[i].id}');
                                            print('ProductID (snapshot) => ${snapshot.data!.docs[i].get('productId')}');
                                            print('ProductID (model) => ${widget.products[index].productId}');

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
}