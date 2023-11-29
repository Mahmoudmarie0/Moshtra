import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:moshtra/utils/constants/colors.dart';

import '../../utils/constants/assets.dart';

import '../Home_layout/controller.dart';

class MyCartScreen extends StatelessWidget {
   MyCartScreen({super.key});
  HomeLayoutController homeLayoutController=Get.put(HomeLayoutController(),permanent: true);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.CartListEmpty),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Your Cart is empty',
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
                  'Looks like you have not added anything in your \ncart. Go ahead and explore top categories.',

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
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
              ),
            ]
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Row(
    //       children: [
    //         Text('My Cart'),
    //         Spacer(),
    //         Text(
    //           'Voucher Code',
    //           style: TextStyle(
    //             color: Color(0xff21D4B4),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   body: Product(),
    // );
  }

}


// class Product extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: ListView(
//         children: [
//           Container(
//             width: 328.w,
//             height: 120.h,
//             child: Row(
//               children: [
//                 Container(
//                     width: 120.w,
//                     height: 120.h,
//                     child: Image(
//                       image: AssetImage('assetName'),
//                     )),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                         margin: EdgeInsets.symmetric(horizontal: 8),
//                         width: 168.w,
//                         child: Text(
//                           'Loop Silicone Strong Magnetic Watch',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                           ),
//                         )),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       child: Text('\$15.25'),
//                     ),
//                     Container(
//                       width: 96.w,
//                       height: 32.h,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                               child: IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.remove))),
//                           Spacer(),
//                           Expanded(
//                               child: Text(
//                                 '1',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               )),
//                           Expanded(
//                               child: IconButton(
//                                   onPressed: () {}, icon: Icon(Icons.add)))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Checkbox(value: true, onChanged: (bool? value) {}),
//                         IconButton(onPressed: () {}, icon: Icon(Icons.delete))
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

