import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Home_layout/controller.dart';

import '../../utils/constants/components.dart';

import 'controller/Controller.dart';
import 'model.dart';
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  HomeLayoutController homeLayoutController=Get.put(HomeLayoutController());
  //CategoriesController categoriesController=Get.put(CategoriesController());
  Widget build(BuildContext context) {


    return  GetBuilder<CategoriesController>(
      init: CategoriesController(),
      builder : (controller)=>
          ListView.separated(
            itemBuilder: (context,index)=>controller.buildCatItem(controller.categoriesModel!.data!.data[index]),
            separatorBuilder: (context,index)=>MyDivider(),
            itemCount:controller.categoriesModel!.data!.data.length,
          ),




    );
  }


}























