import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Home/model.dart';
import 'package:moshtra/utils/constants/colors.dart';


import '../../utils/constants/assets.dart';
import 'controller/Controller.dart';

class HomeScreen extends StatelessWidget {

  HomeController homeController=Get.put(HomeController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:  EdgeInsets.only(top: 44,left: 16,right: 16),
          child: SingleChildScrollView(
            child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 343.w ,
                height:  32.h,
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsPaths.MoshtraLogoBlack),
                    Spacer(),
                  SvgPicture.asset(AssetsPaths.SearchIcon),

                  ],
                ),


              ),
              SizedBox(height: 24.h,),
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (Controller){
                    return ConditionalBuilder(
                        condition: Controller.homeModel!=null,
                        builder:(context)=>products(Controller.homeModel!,Get.context),
                        fallback: (context)=>Center(child: CircularProgressIndicator())
                    );

                  }
              ),
              // Row(
              //   children: [
              //     Text('Categories',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
              //     Spacer(),
              //   TextButton(
              //     onPressed: () {  },
              //     child:Text("SEE ALL",style: TextStyle(color: AppColors.orange,fontWeight: FontWeight.w700,fontSize: 10.sp),),
              //          )
              //
              //
              //   ],
              //
              //
              // ),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     Container(
              //
              //
              //     ),
              //
              //
              //
              //   ],
              //
              //
              //
              // ),

              
              
            ]
            ),
          ),
        ));
  }
}


Widget products(HomeModel model,context)=> SingleChildScrollView(
  physics: BouncingScrollPhysics(),
  child:Column(
    children: [
      CarouselSlider(items: model.data!.banners.map(
            (e) =>
          Image(
  
            image:NetworkImage('${e.image}'),
  
            width: double.infinity,
  
            fit: BoxFit.cover,
  
          ),).toList(),
        options: CarouselOptions(
  
          height: 250.0,
  
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
      Container(
        color: Colors.white38,
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing:1.0 ,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1/1.90,
          children: List.generate(model.data!.products.length, (index) =>buildGridProduct(model.data!.products[index])),
  
  
  
  
        ),
      ),
    ],
  ),
);




Widget buildGridProduct(ProductModel model)=>Container(
  color:Colors.white,
  child:   Column(
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
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  icon:Icon(
                    Icons.favorite_border,
                  size: 14.0,
                  )
                )





              ],

            ),
          ],
        ),
      ),
    ],
  ),
);










