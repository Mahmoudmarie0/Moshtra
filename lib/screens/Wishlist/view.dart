import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:moshtra/screens/Details/controller/extension.dart';
import 'package:moshtra/utils/constants/colors.dart';

import '../../models/fav_model.dart';
import '../../models/products_model.dart';
import '../../utils/constants/assets.dart';

import '../../utils/custom_widgets/global_widgets/empty_screen.dart';
import '../Details/view.dart';
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


  Widget favListScreen() {
    return StreamBuilder<QuerySnapshot>(
        stream: fav.orderBy('createdAt').snapshots(),
        builder: (context , snapshot) {

          List<Fav> favtList = [];
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          else {

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              if (snapshot.data!.docs[i].get('userId') ==
                  FirebaseAuth.instance.currentUser!.uid) {
                favtList.add(Fav.fromJson(snapshot.data!.docs[i]));
              }
            }
          }

          if(favtList.length == 0)
            return buildEmptyScreen(titleText: 'Your Favorite is empty' ,subTitleText:  'Looks like you have not added anything in your \nFavorite. Go ahead and explore top categories.' ,btnText:  'Explore Categories' ,homeLayoutController:  homeLayoutController );
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
                                GestureDetector(
                                  onTap: (){

                                    Color c = HexColor.fromHex(favtList[index].description);
                                    ProductModel product = ProductModel(name: favtList[index].name , color: c , Sized:favtList[index].description , descriptionEN: favtList[index].Sized, descriptionAR: favtList[index].Sized ,sub_description: favtList[index].sub_description ,  image:favtList[index].image , price:favtList[index].price , productId:favtList[index].productId);
                                    Get.to(DetailsScreen(product));

                                  },
                                  child: Container(
                                      width: 120.w,
                                      height: 120.h,
                                      child: Image.network(
                                        favtList[index].image,
                                      )
                                  ),
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