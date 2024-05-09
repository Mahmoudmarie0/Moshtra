
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Categories/view.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/screens/MyCart/view.dart';
import 'package:moshtra/screens/Profile/view.dart';
import 'package:moshtra/screens/Wishlist/view.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../Home/view.dart';
import 'controller.dart';


  class HomeLayout extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
 //  HomeLayout({key});

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
                  MyFavScreen(),
                  ProfileScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(

                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.white,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 300.w,
                      height: 50.h,
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
                            'Home'.tr,
                            style: TextStyle(
                                color:Controller.bottom_Item_1_pressed ? AppColors.black:AppColors.placeholder,
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
                            'Categories'.tr,
                            style: TextStyle(
                                color: Controller.bottom_Item_2_pressed ? AppColors.black:AppColors.placeholder,
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
                            'My Cart'.tr,
                            style: TextStyle(
                                color: Controller.bottom_Item_3_pressed ? AppColors.black:AppColors.placeholder,
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
                            'Wishlist'.tr,
                            style: TextStyle(
                                color: Controller.bottom_Item_4_pressed ? AppColors.black:AppColors.placeholder,
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
                            'Profile'.tr,
                            style: TextStyle(
                                color: Controller.bottom_Item_5_pressed ? AppColors.black:AppColors.placeholder,
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