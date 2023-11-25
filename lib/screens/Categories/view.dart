import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/components.dart';
import 'controller/Controller.dart';
import 'model.dart';

class CategoriesScreen extends StatelessWidget {
CategoriesController categoriesController=Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {

      return  GetBuilder<CategoriesController>(
            init: CategoriesController(),
            builder : (controller)=>
              ListView.separated(
                itemBuilder: (context,index)=>buildCatItem(controller.categoriesModel!.data!.data[index]),
                separatorBuilder: (context,index)=>MyDivider(),
                itemCount:controller.categoriesModel!.data!.data.length,
              ),




          );
      }


  }


  Widget buildCatItem(DataModel model)=>  Padding(
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
      );







