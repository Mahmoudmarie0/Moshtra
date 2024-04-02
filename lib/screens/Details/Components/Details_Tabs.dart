import 'dart:math';

import 'package:flutter/material.dart';
//
// class DetailsTabs extends StatefulWidget {
//   List<String> TabName = ['Details','Comments'];
//
//
//   @override
//   State<DetailsTabs> createState() => _DetailsTabsState();
// }
//
// class _DetailsTabsState extends State<DetailsTabs> {
//   @override
//   Widget build(BuildContext context) {
//     String Tabname = '';
//     int selectedTab = 0;
//
//     return  DefaultTabController(
//       length: 2,
//       child: Column(
//         children: [
//           TabBar(
//             onTap: (index)
//             {
//               selectedTab = index;
//             },
//             indicatorColor: Colors.transparent,
//               tabs: [
//                  //var isSelected = widget.TabName.indexOf(0) == selectedTab;
//              //TabItem(true,widget.TabName),
//           ])
//         ],
//       ),
//     );
//   }
// }

class TabItem extends StatelessWidget {
  bool selected;
  String name;
  //List<String> TabName = ['Details','Comments'];
  TabItem(this.name,this.selected);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selected ? Colors.blue : Colors.transparent,
            border: Border.all(color: Colors.blue,width: 2)
          ),
          child: Text(name,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.blue
        ),),
        ),
        SizedBox(height: 3,),
        Visibility(
          visible: selected,
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
            ),
          ),)
      ],
    );
  }
}

