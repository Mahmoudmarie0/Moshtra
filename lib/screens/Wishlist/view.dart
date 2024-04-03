import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:moshtra/utils/constants/colors.dart';

import '../../models/fav_model.dart';
import '../../utils/constants/assets.dart';

import '../Home_layout/controller.dart';

class MyFavScreen extends StatefulWidget {
  //MyCartScreen({super.key});

  @override
  State<MyFavScreen> createState() => _MyFavScreenState();
}

class _MyFavScreenState extends State<MyFavScreen> {
  HomeLayoutController homeLayoutController=Get.put(HomeLayoutController(),permanent: true);

  CollectionReference fav = FirebaseFirestore.instance.collection('favorites');

  @override
  Widget build(BuildContext context) {

    return favListScreen();

  }

  Widget buildEmptyFavList() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.CartListEmpty),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Your Favorite is empty',
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
                  'Looks like you have not added anything in your \nFavorite. Go ahead and explore top categories.',

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
                    homeLayoutController.SeeAll();

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
                    'Explore Categories',
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

  Widget favListScreen() {
    return StreamBuilder<QuerySnapshot>(
        stream: fav.orderBy('createdAt').snapshots(),
        builder: (context , snapshot) {

          List<Fav> favtList = [];

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if( snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid ) {

              favtList.add(Fav.fromJson(snapshot.data!.docs[i]));

            }
          }

          if(favtList.length == 0)
            return buildEmptyFavList();
          else
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 328.w,
                            height: 120.h,
                            child: Row(
                              children: [
                                Container(
                                    width: 120.w,
                                    height: 120.h,
                                    child: Image.network(
                                      favtList[index].image,
                                    )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 8),
                                        width: 165,
                                        child: Text(
                                          favtList[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(left: 10, right: 10),
                                      child:
                                      Text(
                                        '${favtList[index].price} EGP',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () async{

                                            for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                                              if (snapshot.data!.docs[i].get('userId') == FirebaseAuth.instance.currentUser!.uid &&
                                                  snapshot.data!.docs[i].get('productId') == favtList[index].productId){
                                                fav.doc(snapshot.data!.docs[i].id).delete();
                                              }
                                            }

                                            setState(() {});
                                          },
                                          child: SvgPicture.asset(
                                              AssetsPaths.Trash
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: favtList.length,
                    ),
                  ),
                ),
              ],
            );
        }
    );
  }

}