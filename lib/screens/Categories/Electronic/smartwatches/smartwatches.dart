// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:moshtra/models/products_model.dart';
// import 'package:moshtra/models/smart_watches_model.dart';
// import 'package:moshtra/screens/Categories/Electronic/smartwatches/Controller.dart';
// import 'package:moshtra/screens/Details/view.dart';
// import 'package:moshtra/utils/constants/colors.dart';
// import 'package:moshtra/utils/custom_text/view.dart';
//
// class SmartWatchesScreen extends StatelessWidget{
//   SmartWatchesModel smartWatchesModel;
//
//   SmartWatchesScreen(this.smartWatchesModel);
//   @override
//   Widget build(BuildContext context) {
//
//   return GetBuilder<SmartWatchesController>(
//     init: SmartWatchesController(),
//     builder: (controller) =>
//     controller.loading.value ? Center(child: CircularProgressIndicator())
//         : Scaffold(
//       resizeToAvoidBottomInset: false,
//
//       body: Container(
//
//         padding: EdgeInsets.only(top: 60, left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomText(
//               text: 'Smart Watches',
//               fontSize: 18,
//               fontweight: FontWeight.w800,),
//             SizedBox(height: 30.h,),
//             GridViewSmartWatches(),
//
//
//           ],
//         ),
//       ),
//     ),
//   );
//   }
//   GridViewSmartWatches() {
//     return GetBuilder<SmartWatchesController>(
//       builder:(controller)=> Container(
//           height: 700.h,
//
//           child:SingleChildScrollView(
//             child: GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 1/1.20,
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 0.5,
//
//                 ),
//                 itemCount: controller.smartwatchesModel.length,
//                 itemBuilder: (context,index){
//                   return Container(
//                     width: MediaQuery.of(context).size.width*.4,
//                     child: Column(
//                       children: [
//
//                         Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               color: Colors.grey.shade100,
//
//                             ),
//
//                             width: MediaQuery.of(context).size.width*.4,
//
//                             child: Container(
//                               height:100,
//                               width: 150,
//
//                               child: Image.network(controller.smartwatchesModel[index].image as String,fit:BoxFit.fill,),
//                             ),
//                           ),
//                         SizedBox(height: 9.h,),
//                         CustomText(text: controller.smartwatchesModel[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
//                         SizedBox(height: 5.h,),
//                         CustomText(text: controller.smartwatchesModel[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
//                         SizedBox(height: 5.h,),
//                         CustomText(text: controller.smartwatchesModel[index].price.toString()+' EGP' as String,color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),
//
//                       ],
//                     ),
//                   );
//
//
//
//                 }),
//           )
//
//
//
//       ),
//
//     );
//   }
//
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/models/smart_watches_model.dart';
import 'package:moshtra/screens/Categories/Electronic/smartwatches/Controller.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/utils/constants/assets.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

class SmartWatchesScreen extends StatelessWidget{
  SmartWatchesModel smartWatchesModel;

  SmartWatchesScreen(this.smartWatchesModel);
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SmartWatchesController>(
      init: SmartWatchesController(),
      builder: (controller) =>
      controller.loading.value ? Center(child: CircularProgressIndicator())
          : Scaffold(
        resizeToAvoidBottomInset: false,

        body: Container(

          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Smart Watches',
                fontSize: 18,
                fontweight: FontWeight.w800,),
              SizedBox(height: 30.h,),
              GridViewSmartWatches(),


            ],
          ),
        ),
      ),
    );
  }
  GridViewSmartWatches() {
    return GetBuilder<SmartWatchesController>(
      builder:(controller)=> Container(
          height: 700.h,

          child:SingleChildScrollView(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1/1.20,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0.5,

                ),
                itemCount: controller.smartwatchesModel.length,
                itemBuilder: (context,index){
                  return Container(
                    width: MediaQuery.of(context).size.width*.4,
                    child: Column(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,

                          ),

                          width: MediaQuery.of(context).size.width*.4,

                          child: Container(
                            height:140,
                            width: 150,

                            child: Stack(
                                alignment: Alignment.center,

                                children:[

                                  Image.network(controller.smartwatchesModel[index].image as String,fit:BoxFit.fill,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                          onTap: (){

                                          },
                                          child: SvgPicture.asset(AssetsPaths.FavIcon,fit: BoxFit.fill,))),

                                ]


                            ),

                            //Image.network(controller.smartwatchesModel[index].image as String,fit:BoxFit.fill,),
                          ),
                        ),
                        SizedBox(height: 9.h,),
                        CustomText(text: controller.smartwatchesModel[index].name as String,alignment: Alignment.center,fontweight: FontWeight.w600,fontSize: 14, ),
                        SizedBox(height: 5.h,),
                        CustomText(text: controller.smartwatchesModel[index].sub_description as String,alignment: Alignment.center,color: AppColors.grey,fontweight: FontWeight.w400,maxLine: 1,fontSize: 13,),
                        SizedBox(height: 5.h,),
                        CustomText(text: controller.smartwatchesModel[index].price.toString()+' EGP' as String,color:AppColors.black,fontweight: FontWeight.w500 ,alignment: Alignment.center,fontSize: 12,),

                      ],
                    ),
                  );



                }),
          )



      ),

    );
  }

}
