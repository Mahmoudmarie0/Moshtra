
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
import 'package:moshtra/screens/Wishlist/database/fav_view_model.dart';
import 'package:moshtra/utils/constants/assets.dart';
import '../../models/products_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
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

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top:60,left: 5,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SearchTextFormField(),

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
                SizedBox(height: 4.h,),
                ListViewProduct(),
              ],
            ),
          ),
        ),


      ),
    );
  }

  Widget SearchTextFormField() {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Colors.black,),
          label:CustomText(text: 'Search in Moshtra',fontSize: 18,fontweight: FontWeight.w300,color: AppColors.grey,),


        ),
      ),
    );

  }

  Widget ListViewCategory() {
    return GetBuilder<HomeController>(
      builder:(controller)=> Container(
        height: 100.h,
        child: ListView.separated(
          itemCount:4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              children: [
                SingleChildScrollView(
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,

                    ),
                    height: 60.h,
                    width: 76.w,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image .network(controller.categoryModel[index].image as String),
                    ),
                  ),
                ),

                SizedBox(height: 1.h,),
                Text(controller.categoryModel[index].name as String,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 10.sp,color: AppColors.black),),
              ],
            );



          }, separatorBuilder: ( context,  index) =>SizedBox(
          width: 20,
        ),



        ),
      ),
    );
  }

  ListViewProduct() {
    return GetBuilder<HomeController>(
      builder:(controller)=> Container(
          height: 1000.h,


          child:GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1/1.20,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 0.5,

              ),
              itemCount: controller.productModel.length,
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*.4,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(DetailsScreen(controller.productModel[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,

                          ),

                          width: MediaQuery.of(context).size.width*.4,
                          height: 135.h,

                          child: Container(
                            height:138,
                            width: 160,


                            child: Stack(
                                alignment: Alignment.center,

                                children:[

                                  Image.network(controller.productModel[index].image as String,fit:BoxFit.fill,),

                                  GetBuilder<FavViewModel>(
                                    init: Get.put(FavViewModel()),
                                    builder: (controller2) => Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: (){
                                              controller2.addProduct(
                                                  FavProductModel(
                                                      name: controller.productModel[index].name,
                                                      price: controller.productModel[index].price,
                                                      image: controller.productModel[index].image,
                                                      productId: controller.productModel[index].productId
                                                  )
                                              );
                                              showSnackBarFun(context);
                                              print("done");

                                            },
                                            child: SvgPicture.asset(AssetsPaths.FavIcon,fit: BoxFit.fill,))),
                                  ),

                                ]


                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.h,),
                      CustomText(text: controller.productModel[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                      SizedBox(height: 5.h,),
                      CustomText(text: controller.productModel[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                      SizedBox(height: 5.h,),
                      CustomText(text: controller.productModel[index].price.toString()+' EGP' as String,color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),


                    ],
                  ),
                );



              })



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
            bottom: MediaQuery.of(context).size.height - 200,
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
                  'The product has been added to\nyour Favorite',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            GestureDetector(
              child: Text('View Favorite'
                ,style: TextStyle(
                    color: AppColors.orange
                ),
              ),
              onTap: (){ Get.to(MyFavScreen()); },
            )
          ],
        )

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}