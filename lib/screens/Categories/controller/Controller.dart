import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Dio/DioHelper.dart';
import '../../../utils/constants/components.dart';
import '../../../utils/constants/endpoints.dart';
import '../model.dart';

class CategoriesController extends GetxController{
  CategoriesModel ?categoriesModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  getCategoriesData();
  }

  void getCategoriesData(){
    DioHelper.getData(url: Endpoints.getCategories,
      token: token,
    ).then((value){
      if(value!=null)
        categoriesModel=CategoriesModel.fromJson(value.data);
    }).catchError((error){
      print(error.toString());
    });
    update();

    }









}