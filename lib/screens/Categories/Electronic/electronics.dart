// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:moshtra/utils/constants/assets.dart';
// import 'package:moshtra/utils/constants/colors.dart';
//
// class Electronic extends StatelessWidget {
//   const Electronic({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return   MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: AppColors.white,
//         appBar: AppBar(
//           title: Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Text('Electronic', style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w400),),
//           ),
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           // centerTitle: true,
//
//         ),
//         body:  SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15.0,right: 15.0),
//             child: GridView.count(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               mainAxisSpacing:1.0 ,
//               crossAxisSpacing: 3.0,
//               childAspectRatio: 1/2,
//               children: <Widget>[
//
//                 Container(
//             color:Colors.white,
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // الصوره
//                   Stack(
//                     alignment: AlignmentDirectional.bottomStart,
//                     children: [
//                       Image.asset(AssetsPaths.Iphone,height: 200.h,width: double.infinity,),
//
//                       // بتاع كلمه تخفيض
//                       Container(
//                         color: Colors.red,
//                         padding: EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Text(
//                           'DISCOUNT',
//                           style: TextStyle(
//                             fontSize: 8.0,
//                             color: AppColors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     //الالوان والاسم
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SvgPicture.asset(AssetsPaths.ColorsText,),
//                         Text('Apple iPhone 15 Pro Max (256 GB) - Natural '
//                             '\n Titanium Dual Sim',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 14.0,
//                             height: 1.3,
//                           ),
//                         ),
//                         // السعرر
//                         Row(
//                           children: [
//                             Text(
//                               '\$76000',
//                               style: TextStyle(
//                                 fontSize: 12.0,
//                                 height: 1.3,
//                                 color: AppColors.blue,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 5.0,
//                             ),
//
//                             Text(
//                               '\$80000',
//                               style: TextStyle(
//                                 fontSize: 10.0,
//                                 height: 1.3,
//                                 color: AppColors.grey,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//
//                             Spacer(),
//
//                             SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                           ],
//
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//             ),
//               Container(
//                 color:Colors.white,
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // الصوره
//                     Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Image.asset(AssetsPaths.RealmiPhone ,height: 200.h,width: double.infinity,),
//
//                         // بتاع كلمه تخفيض
//                         Container(
//                           color: Colors.red,
//                           padding: EdgeInsets.symmetric(horizontal: 5.0),
//                           child: Text(
//                             'DISCOUNT',
//                             style: TextStyle(
//                               fontSize: 8.0,
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       //الالوان والاسم
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(AssetsPaths.ColorsText,),
//                           Text('Realme C55 Dual SIM 8GB RAM 256GB Rainy'
//                               ' \n Night 4G LTE,Black',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               height: 1.3,
//                             ),
//                           ),
//                           // السعرر
//                           Row(
//                             children: [
//                               Text(
//                                 '\$7990',
//                                 style: TextStyle(
//                                   fontSize: 12.0,
//                                   height: 1.3,
//                                   color: AppColors.blue,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5.0,
//                               ),
//
//                               Text(
//                                 '\$8500',
//                                 style: TextStyle(
//                                   fontSize: 10.0,
//                                   height: 1.3,
//                                   color: AppColors.grey,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//
//                               Spacer(),
//
//                               SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                             ],
//
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ),
//               Container(
//                 color:Colors.white,
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // الصوره
//                     Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Image.asset(AssetsPaths.EarWirless,height: 200.h,width: double.infinity,),
//
//                         // بتاع كلمه تخفيض
//                         Container(
//                           color: Colors.red,
//                           padding: EdgeInsets.symmetric(horizontal: 5.0),
//                           child: Text(
//                             'DISCOUNT',
//                             style: TextStyle(
//                               fontSize: 8.0,
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       //الالوان والاسم
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(AssetsPaths.ColorsText,),
//                           Text("M10 TWS Bluetooth V5.1 in-Ear Wireless Earbuds"
//                               " \n with Upto 4 Hours Playback Stereo Sports Waterproof "
//                               "\n Bluetooth Earphones with Mic,"
//                               "\n Noise-Cancellation, (Black, True Wireless)",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               height: 1.3,
//                             ),
//                           ),
//                           // السعرر
//                           Row(
//                             children: [
//                               Text(
//                                 '\$193',
//                                 style: TextStyle(
//                                   fontSize: 12.0,
//                                   height: 1.3,
//                                   color: AppColors.blue,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5.0,
//                               ),
//
//                               Text(
//                                 '\$250',
//                                 style: TextStyle(
//                                   fontSize: 10.0,
//                                   height: 1.3,
//                                   color: AppColors.grey,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//
//                               Spacer(),
//
//                               SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                             ],
//
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ),
//               Container(
//                 color:Colors.white,
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // الصوره
//                     Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Image.asset(AssetsPaths.Watch,height: 200.h,width: double.infinity,),
//
//                         // بتاع كلمه تخفيض
//                         Container(
//                           color: Colors.red,
//                           padding: EdgeInsets.symmetric(horizontal: 5.0),
//                           child: Text(
//                             'DISCOUNT',
//                             style: TextStyle(
//                               fontSize: 8.0,
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       //الالوان والاسم
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(AssetsPaths.ColorsText,),
//                           Text('Loop Silicone Strong Magnetic Watch',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               height: 1.3,
//                             ),
//                           ),
//                           // السعرر
//                           Row(
//                             children: [
//                               Text(
//                                 '\$120',
//                                 style: TextStyle(
//                                   fontSize: 12.0,
//                                   height: 1.3,
//                                   color: AppColors.blue,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5.0,
//                               ),
//
//                               Text(
//                                 '\$250',
//                                 style: TextStyle(
//                                   fontSize: 10.0,
//                                   height: 1.3,
//                                   color: AppColors.grey,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//
//                               Spacer(),
//
//                               SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                             ],
//
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ),
//               Container(
//                 color:Colors.white,
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // الصوره
//                     Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Image.asset(AssetsPaths.Earbuds,height: 200.h,width: double.infinity,),
//
//                         // بتاع كلمه تخفيض
//                         Container(
//                           color: Colors.red,
//                           padding: EdgeInsets.symmetric(horizontal: 5.0),
//                           child: Text(
//                             'DISCOUNT',
//                             style: TextStyle(
//                               fontSize: 8.0,
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       //الالوان والاسم
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(AssetsPaths.ColorsText,),
//                           Text('M28 bt5.1 headset game earbuds true wireless headphones '
//                               '\n led light display with mic noise isolation fast',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               height: 1.3,
//                             ),
//                           ),
//                           // السعرر
//                           Row(
//                             children: [
//                               Text(
//                                 '\$249',
//                                 style: TextStyle(
//                                   fontSize: 12.0,
//                                   height: 1.3,
//                                   color: AppColors.blue,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5.0,
//                               ),
//
//                               Text(
//                                 '\$320',
//                                 style: TextStyle(
//                                   fontSize: 10.0,
//                                   height: 1.3,
//                                   color: AppColors.grey,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//
//                               Spacer(),
//
//                               SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                             ],
//
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ),
//                 Container(
//             color:Colors.white,
//             child:Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // الصوره
//                 Stack(
//                   alignment: AlignmentDirectional.bottomStart,
//                   children: [
//                     Image.asset(AssetsPaths.Speaker,height: 200.h,width: double.infinity,),
//
//                     // بتاع كلمه تخفيض
//                     Container(
//                       color: Colors.red,
//                       padding: EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(
//                         'DISCOUNT',
//                         style: TextStyle(
//                           fontSize: 8.0,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   //الالوان والاسم
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SvgPicture.asset(AssetsPaths.ColorsText,),
//                       Text('JBL Boombox 3 Portable Speaker, Massive JBL Signature'
//                           '\n Pro Sound, Monstrous Bass, 24H Battery, ',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           height: 1.3,
//                         ),
//                       ),
//                       // السعرر
//                       Row(
//                         children: [
//                           Text(
//                             '\$2230',
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               height: 1.3,
//                               color: AppColors.blue,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5.0,
//                           ),
//
//                           Text(
//                             '\$3000',
//                             style: TextStyle(
//                               fontSize: 10.0,
//                               height: 1.3,
//                               color: AppColors.grey,
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//
//                           Spacer(),
//
//                           SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                         ],
//
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//           ),
//               ]
//             ),
//           ),
//         ),
//         // body: ListView.builder(
//         //   itemBuilder: (context , index) => buildElectronic(),
//         //   itemCount: 3,
//         // ),
//       )
//     );
//   }
//   Widget buildElectronic() =>
//       Container(
//         color:Colors.white,
//         child:Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//            // الصوره
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                Image.asset(AssetsPaths.Watch,height: 200.h,width: double.infinity,),
//
//                // بتاع كلمه تخفيض
//                   Container(
//                     color: Colors.red,
//                     padding: EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Text(
//                       'DISCOUNT',
//                       style: TextStyle(
//                         fontSize: 8.0,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               //الالوان والاسم
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(AssetsPaths.ColorsText,),
//                   Text('Iphone 12 Pro Max',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       height: 1.3,
//                     ),
//                   ),
//                   // السعرر
//                   Row(
//                     children: [
//                       Text(
//                         '\$250',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           height: 1.3,
//                           color: AppColors.blue,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.0,
//                       ),
//
//                         Text(
//                           '\$120',
//                           style: TextStyle(
//                             fontSize: 10.0,
//                             height: 1.3,
//                             color: AppColors.grey,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//
//                       Spacer(),
//
//                       SvgPicture.asset(AssetsPaths.FavIcon,width: 24.w,height: 24.h,),
//
//                     ],
//
//                   ),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//
//       );
// }
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/screens/Categories/Electronic/controller/Controller.dart';
import 'package:moshtra/screens/Categories/Electronic/smartwatches/smartwatches.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

class ElectronicsScreen  extends StatelessWidget {
  ElectronicsModel electronicsModel;

  ElectronicsScreen(this.electronicsModel);


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
                CustomText(
                  text: 'Electronics',
                  fontSize: 18,
                  fontweight: FontWeight.w800,),
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
                  color: Colors.grey.shade100,
                  shape: BoxShape.rectangle
              ),
              height: 700.h,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0
                ),

                itemCount: controller.electronicsModel.length,

                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                      onTap:() {
                    Get.to(SmartWatchesScreen(controller.smartwatchesModel[index]));
                  },
                    child:  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                          shape: BoxShape.rectangle
                        ),
                        height: 100.h,
                        width: 6000.w,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image .network(controller.electronicsModel[index].image as String),
                        ),
                      ),
                      ),
                      SizedBox(height: 1.h,),
                      Text(controller.electronicsModel[index].name as String,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 10.sp,color: AppColors.black),),
                    ],
                  );
                },

              )
          ),
    );
  }
}



