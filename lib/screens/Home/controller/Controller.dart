





import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/Dio/DioHelper.dart';
import 'package:moshtra/screens/Details/view.dart';

import 'package:moshtra/screens/Home/model.dart';
import 'package:moshtra/utils/constants/components.dart';

import 'package:moshtra/utils/constants/endpoints.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../Categories/model.dart';

import '../../Home_layout/controller.dart';



class HomeController extends GetxController{
      HomeModel? homeModel;
      CategoriesModel? categoriesModel;
      HomeLayoutController homeLayoutController=Get.put(HomeLayoutController(),permanent: true);


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
    getCategoriesData();
    refresh();
    update();
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    update();
  }


  void getHomeData(){
      DioHelper.getData(url: Endpoints.Home,
        token: token,
      ).then((value){
        if(value!=null)
        homeModel=HomeModel.fromJson(value.data);
        printFullText('${homeModel!.data!.banners[0].image}');
        if((homeModel!.status)!=null){
          print('yess');
        print(homeModel?.status);}
      }).catchError((error){
        print(error.toString());
      });
      update();

    }


  void getCategoriesData(){
    DioHelper.getData(url: Endpoints.getCategories,
      token: token,
    ).then((value){
      if(value!=null)
        categoriesModel=CategoriesModel.fromJson(value.data);
    }).catchError((error){
      print(error.toString());
    });
    update();

  }

//product widget
  Widget products(homeModel,categoriesModel ,context)=> SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child:Column(
      children: [
        CarouselSlider(
          items: homeModel.data!.banners.map<Widget>(
                (e) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Same radius as Container
                child: Image(
                  image: NetworkImage('${e.image}'),
                  width: 328.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ).toList(),
          options: CarouselOptions(
            height: 200.h,

            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 24.h,),
        Row(
          children: [
            Text('Categories',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18.sp),),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {

                homeLayoutController.SeeAll();


              },
              child:Text("SEE ALL",style: TextStyle(color: AppColors.orange,fontWeight: FontWeight.w700,fontSize: 10.sp),),
            ),
          ],


        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.0,

                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>buildCategoryItem(categoriesModel.data!.data[index],),
                  separatorBuilder: (context,index)=>SizedBox(
                    width: 10.0,
                  ),
                  itemCount: 3,//categoriesModel.data!.data.length,

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),

          child: Column(
            children: [
              Row(
                children: [
                  Text('Latest Products',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18.sp),),
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {  },
                    child:Text("SEE ALL",style: TextStyle(color: AppColors.orange,fontWeight: FontWeight.w700,fontSize: 10.sp),),
                  ),
                ],
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing:1.0 ,
                crossAxisSpacing: 3.0,
                childAspectRatio: 1/2,
                children: List.generate(homeModel.data!.products.length, (index) =>buildGridProduct(homeModel.data!.products[index])),
              ),
            ],
          ) ,
        ),
      ],
    ),
  );

//GridProduct
  Widget buildGridProduct(ProductModel model)=>InkWell(
    onTap:()=> Get.to(DetailsScreen()),
    child: Container(
      color:Colors.white,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(image: NetworkImage(model.image!),

                  height: 200.h,
                  width: double.infinity,
                ),
                if(model.discount!=0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AssetsPaths.ColorsText,),
                Text(model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$'+"${model.price!.round()}",
                      style: TextStyle(
                        fontSize: 12.0,
                        height: 1.3,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if(model.discount!=0)
                      Text(
                        '\$'+"${model.price!.round()}",

                        style: TextStyle(

                          fontSize: 10.0,

                          height: 1.3,

                          color: AppColors.grey,

                          decoration: TextDecoration.lineThrough,







                        ),



                      ),
                    Spacer(),
                    SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),







                  ],

                ),

              ],
            ),
          ),
        ],
      ),
    ),
  );


  Widget buildCategoryItem(DataModel model)=>  Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image!),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,

      ),
      Container(
          color: Colors.black.withOpacity(.8),
          width: 100.0,

          child: Text(model.name!,

            textAlign: TextAlign.center,
            maxLines: 1,
            overflow:TextOverflow.ellipsis ,
            style: TextStyle(
              color: Colors.white,
            ),
          ))




    ],



  );





}