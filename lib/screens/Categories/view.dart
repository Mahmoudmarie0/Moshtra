import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../../utils/custom_widgets/global_widgets/SearchField.dart';
import 'SubCategory/subCategory_view.dart';
import 'controller/Controller.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: AppColors.grayish_blue,
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 10),
                    child: Container(
                      color: AppColors.grayish_blue,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          SearchTextFormField(),
                        ],
                      ),
                    ),
                  ),
                  GridViewCategory(),
                ],
              ),
            ),
    );
  }

  Widget GridViewCategory() {
    return Expanded(
      child: SingleChildScrollView(
        child: GetBuilder<CategoryController>(
          builder: (controller) => Container(
              height: 700.h,
              child: GridView.builder(
                padding: EdgeInsets.only(top: 25),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 3.0),
                itemCount: controller.CatModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await controller.LoadData(index);
                          if (controller.CatModel[index].product.isNotEmpty) {
                            Get.to(SubCategoryScreen(
                                controller.CatModel[index].product.toList(),
                                Get.locale?.languageCode == "en"? controller.CatModel[index].nameEN.toString():  controller.CatModel[index].nameAR.toString(),
                                controller.CatModel[index].id!,
                                ));
                            //print(controller.CatModel[index].product[0].name);
                          }
                        },
                        child: Container(
                          height: 115,
                          width: 150,
                          // decoration:BoxDecoration(borderRadius:BorderRadius.circular(50.r), ) ,
                          child: Image.network(
                            controller.CatModel[index].image as String,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomText(
                        text:Get.locale?.languageCode == "en"? controller.CatModel[index].nameEN.toString():  controller.CatModel[index].nameAR.toString(),
                        alignment: Alignment.center,
                        fontweight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
