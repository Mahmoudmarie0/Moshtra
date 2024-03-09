
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:moshtra/models/fav_product_model.dart';
import 'package:moshtra/screens/Categories/view.dart';
import 'package:moshtra/screens/Details/controller/controller.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/screens/Home/widgets/ListViewProduct.dart';
import 'package:moshtra/screens/Home/widgets/ListviewCategory.dart';
import 'package:moshtra/screens/Wishlist/database/fav_view_model.dart';
import 'package:moshtra/utils/constants/assets.dart';
import '../../models/products_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../../utils/custom_widgets/build_appbar.dart';
import '../../utils/custom_widgets/global_widgets/SearchField.dart';
import '../Wishlist/view.dart';




class HomeScreen extends StatelessWidget {

  ProductModel? model;
  final List<String> names=<String>['men','s','s','s','s'];

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(

      init: HomeController(),

      builder:(controller)=>controller.loading.value ?Center(child: CircularProgressIndicator()): Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: buildAppBar(
          arrowBackDisblay: false,
        ),

        body: ListView(
          children:[
            Column(
            children: [
             // SearchTextFormField(),

              SizedBox(
                height: 15,
              ),

              CarouselSlider(items: controller.bannerModel.map(
                    (e) =>
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        // Adjust the radius as needed
                        // Optionally, you can add other decoration properties like color or border
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(

                          image:NetworkImage('${e.Image}'),

                          width: 400.w,
                          height: 150.h,


                          fit: BoxFit.cover,

                        ),
                      ),
                    ),).toList(),
                options: CarouselOptions(

                  height: 200.0,

                  initialPage: 0,
                  viewportFraction:1.0 ,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    CustomText(text: 'Categories',fontSize: 18,fontweight: FontWeight.w800,),
                    TextButton(onPressed: (){Get.to(CategoriesScreen());},
                      child:   CustomText(text: 'See All',fontSize: 16,fontweight: FontWeight.w500,color: AppColors.orange,),
                    )

                  ],




                ),
              ),

              SizedBox(height: 10.h,),

              ListViewCategory(),

              SizedBox(height: 10.h,),

              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,

                  children: [
                    CustomText(text: 'Latest Products',fontSize: 18,fontweight: FontWeight.w800,),
                  ],
                ),
              ),

              SizedBox(height: 20.h,),

              ListViewProduct(),
            ],
          ),
          ]
        ),


      ),
    );
  }






}