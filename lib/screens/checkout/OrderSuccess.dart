

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:moshtra/screens/Home/view.dart';
import 'package:moshtra/screens/Home_layout/view.dart';
import 'package:moshtra/screens/MyCart/database/cart_view_model.dart';
class OredrSuccessScreen extends StatelessWidget {
  // const ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Image.asset("assets/images/success.png",height: 250,),
            SizedBox(height: 15),
            Text("Success!",style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: 1
            ),),
            SizedBox(height: 20),
            Text("Your Order Will Be Delivered Soon.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,

              ),),
            Text("Thanks You! For Chossing our app!.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,

              ),),
          ],
          ),
          GetBuilder<FavViewModel>(
            builder:(controller) => ElevatedButton(
              onPressed: (){
              Get.to(HomeLayout());
              },

              child: Text('Continue Shopping' ,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:moshtra/screens/checkout/Order_Confirm_Screen.dart';
// import 'package:moshtra/screens/checkout/Payment_method_screen.dart';
// import 'package:moshtra/screens/checkout/shipping_adress_screen.dart';
// import 'package:moshtra/utils/constants/delevery.dart';


// import 'package:status_change/status_change.dart';
//
// class CheckOutView extends StatefulWidget {
//   //const CheckOutView({super.key});
//
//   @override
//   State<CheckOutView> createState() => _CheckOutViewState();
// }
//
// class _CheckOutViewState extends State<CheckOutView> {
//   int _processIndex = 0;
//   Pages pages=Pages.DeliveryTime;
//
//   Color getColor(int index) {
//     if (index == _processIndex) {
//       return inProgressColor;
//     } else if (index < _processIndex) {
//       return Colors.green;
//     } else {
//       return Colors.green ;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title:Text(
//           "CheckOut",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             height: 100,
//             child: StatusChange.tileBuilder(
//               theme: StatusChangeThemeData(
//                 direction: Axis.horizontal,
//                 connectorTheme:ConnectorThemeData(space: 1.0, thickness: 1.0),
//               ),
//
//               builder:  StatusChangeTileBuilder.connected(
//                 itemWidth: (_) =>
//                 MediaQuery.of(context).size.width / _processes.length,
//                 nameWidgetBuilder: (context, index){
//                   return Padding(
//                     padding: const EdgeInsets.only(top:15.0),
//                     child: Text(
//                       _processes[index],
//                       style:TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color:getColor(index),
//                         // change color with dynamic color --> can find it with example section
//                       ),
//                     ),
//                   );
//                 },
//                 indicatorWidgetBuilder: (_, index) {
//                   if(index<=_processIndex){
//                     return DotIndicator(
//                       size: 35.0,
//                       border: Border.all(color: Colors.green,width: 1),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color:Colors.green,
//                           ),
//                         ),
//                       ),
//                     );
//                   }else{
//                     return OutlinedDotIndicator(
//                       size: 30,
//                       borderWidth: 1.0,
//                       color: todoColor,
//                     );
//                   }
//                 },
//                 lineWidgetBuilder: (index) {
//                   if (index > 0) {
//                     if (index == _processIndex) {
//                       final prevColor = getColor(index - 1);
//                       final color=getColor(index);
//                       var gradientColors;
//                       gradientColors=[
//                         prevColor,
//                         Color.lerp(prevColor,color,0.5)
//                       ];
//                       return DecoratedLineConnector(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: gradientColors,
//                           ),
//                         ),
//                       );
//                     } else {
//                       return SolidLineConnector(
//                         color: getColor(index),
//                       );
//                     }
//                   } else {
//                     return null ;
//                   }
//                 },
//                 itemCount: _processes.length,
//               ),
//             ),
//
//           ),
//           pages == Pages.DeliveryTime
//               ? DeliveryTime()
//               : pages == Pages.AddAddress
//               ? AddAddress()
//               : Summary()
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child:Icon(Icons.skip_next),
//         onPressed: () {
//           print(_processIndex);
//           setState(() {
//             _processIndex++;
//             if (_processIndex == 1){
//               pages=Pages.AddAddress;
//             }else if (_processIndex == 2){
//               pages=Pages.Summary;
//             } else if(_processIndex == 3){
//             }
//           });
//         },
//         backgroundColor: inProgressColor,
//       ),
//     );
//   }
// }
// final _processes=[
//   'Delivery',
//   'Address',
//   'Summer',
// ];
