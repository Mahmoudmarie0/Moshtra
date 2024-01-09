import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/screens/Categories/view.dart';
import 'package:moshtra/screens/Details/controller/controller.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/screens/MyCart/view.dart';
import 'package:moshtra/screens/Profile/view.dart';
import 'package:moshtra/screens/Wishlist/view.dart';
import 'package:pinput/pinput.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../Categories/Electronic/electronics.dart';
import '../Details/view.dart';
import '../Home/view.dart';
import 'controller.dart';


  class HomeLayout extends StatelessWidget {
  HomeController controller = Get.put(HomeController());


   // HomeLayout({super.key});

  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
        init:HomeLayoutController(),

        builder:(Controller){
          return Directionality(
            textDirection:TextDirection.ltr,
            child:Scaffold(
            resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: IndexedStack(
                index: Controller.CurrentIndex,
                children: [
                  HomeScreen(),
                  CategoriesScreen(),
                  MyCartScreen(),
                  WishlistScreen(),
                  ProfileScreen(),
                  // DetailsScreen(),
                 // ElectronicScreen(),


                ],


              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                // Fixed
                backgroundColor: Colors.white70,

                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      //   color: Controller.bottom_Item_1_pressed ? AppColors.orange : Colors.white,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.Home,
                            width: 16.w ,
                            height: 16.h ,
                            fit: BoxFit.scaleDown,
                            color: Controller.bottom_Item_1_pressed ? AppColors.orange : AppColors.grey3,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                color:Controller.bottom_Item_1_pressed ? AppColors.black:AppColors.grey,
                                fontSize:12.sp,
                                fontWeight: Controller.bottom_Item_1_pressed ? FontWeight.w500 : FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      //   color: Controller.bottom_Item_2_pressed ? AppColors.orange : Colors.white,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.Categories,
                            width: 16.w ,
                            height: 16.h ,
                            fit: BoxFit.scaleDown,
                            color: Controller.bottom_Item_2_pressed ? AppColors.orange: AppColors.grey3,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'Categorie',
                            style: TextStyle(
                                color: Controller.bottom_Item_2_pressed ? AppColors.black:AppColors.grey,
                                fontSize:12.sp,
                                fontWeight: Controller.bottom_Item_2_pressed ?FontWeight.w500 : FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      //   color: Controller.bottom_Item_3_pressed ? AppColors.orange : Colors.white,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.MyCart,
                            width: 16.w ,
                            height: 16.h ,
                            fit: BoxFit.scaleDown,
                            color:Controller. bottom_Item_3_pressed ? AppColors.orange : AppColors.grey3,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'My Cart',
                            style: TextStyle(
                                color: Controller.bottom_Item_3_pressed ? AppColors.black:AppColors.grey,
                                fontSize:12.sp,

                                fontWeight: Controller.bottom_Item_3_pressed ? FontWeight.w500 : FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      //   color: Controller.bottom_Item_3_pressed ? AppColors.orange : Colors.white,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.Wishlist,
                            width: 16.w ,
                            height: 16.h ,
                            fit: BoxFit.scaleDown,
                            color:Controller. bottom_Item_4_pressed ? AppColors.orange : AppColors.grey3,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'Wishlist',
                            style: TextStyle(
                                color: Controller.bottom_Item_4_pressed ? AppColors.black:AppColors.grey,
                                fontSize:12.sp,

                                fontWeight: Controller.bottom_Item_4_pressed ? FontWeight.w500 : FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem (
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      //   color: Controller.bottom_Item_3_pressed ? AppColors.orange : Colors.white,
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.Profile,
                            width: 16.w ,
                            height: 16.h ,
                            fit: BoxFit.scaleDown,
                            color:Controller. bottom_Item_5_pressed ? AppColors.orange : AppColors.grey3,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: Controller.bottom_Item_5_pressed ? AppColors.black:AppColors.grey,
                                fontSize:12.sp,

                                fontWeight: Controller.bottom_Item_5_pressed ? FontWeight.w500 : FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),


                ],
                showSelectedLabels: false,
              //  backgroundColor: AppColors.white,
                onTap:(CurrentIndex){
                  Controller.NavButtonSwitch(CurrentIndex);


                },





                selectedFontSize: 0.sp,
                unselectedFontSize: 0.sp,
              ),
            ),



          );

        }


    );


  }
}