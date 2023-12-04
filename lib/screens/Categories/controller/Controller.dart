
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/screens/Categories/Electronic/electronic.dart';
import 'package:moshtra/screens/Home_layout/controller.dart';

import '../../../Dio/DioHelper.dart';
import '../../../utils/constants/components.dart';
import '../../../utils/constants/endpoints.dart';
import '../model.dart';

class CategoriesController extends GetxController{
    CategoriesModel? categoriesModel;
HomeLayoutController homeLayoutController=Get.put(HomeLayoutController());



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  getCategoriesData();
  update();
  }
   void getCategoriesData()async{
    await  DioHelper.getData(url: Endpoints.getCategories,
        token: token,
      ).then((value){
        if(value!=null)
          categoriesModel=CategoriesModel.fromJson(value.data);
      }).catchError((error){
        print(error.toString());
      });
      update();

    }
    Widget buildCatItem(DataModel model)=>
        InkWell(
          onTap:()=>Get.to(Electronic()),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image(
                  image:
                  NetworkImage
                    (model.image!),

                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,



                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(model.name!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                  ),),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                ),






              ],




            ),
          ),
        );












}