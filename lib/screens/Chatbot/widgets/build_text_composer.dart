// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../controller/controller.dart';
//
// Widget _buildTextComposer() {
//   ChatBootController chatBootController = Get.put(ChatBootController());
//   return Container(
//     decoration: BoxDecoration(color: AppColors.white,
//       borderRadius: BorderRadius.circular(25),
//     ),
//     margin: EdgeInsets.symmetric(horizontal: 15.0),
//     child: Row(
//       children: <Widget>[
//         Flexible(
//           child: TextField(
//             controller:  chatBootController.textController,
//             onSubmitted: _handleSubmitted,
//             decoration: InputDecoration.collapsed(
//               hintText: 'Ask something',
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 4.0),
//           child: IconButton(
//             icon: _isBotTyping
//                 ? SizedBox(
//               width: 24.0,
//               height: 24.0,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2.0,
//               ),
//             )
//                 : Icon(Icons.send,color: AppColors.blue,),
//             onPressed: _isBotTyping
//                 ? null
//                 : () => _handleSubmitted(_textController.text),
//           ),
//         ),
//       ],
//     ),
//   );
// }