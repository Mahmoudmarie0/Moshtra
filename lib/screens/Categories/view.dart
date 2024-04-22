import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Categories/Electronic/electronics.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../../utils/custom_widgets/global_widgets/SearchField.dart';
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
                            Get.to(ElectronicsScreen(
                                controller.CatModel[index].product.toList(),
                                controller.CatModel[index].name.toString()));
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
                        text: controller.CatModel[index].name as String,
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
