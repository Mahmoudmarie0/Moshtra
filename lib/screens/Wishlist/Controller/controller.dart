import 'package:get/get.dart';
import 'package:moshtra/Dio/DioHelper.dart';
import 'package:moshtra/utils/constants/components.dart';
import 'package:moshtra/utils/constants/endpoints.dart';

import '../model.dart';

class WishListController extends GetxController{

  FavoritesModel? favoritesModel;
  FavoritesData? favoritesData;


  @override
  void onInit() {
    //TODO: implement onInit
    super.onInit();
  }

  void getFavoritesData(){

    DioHelper.getData(
      url: Endpoints.FAVORITES,
      token: token,
    ).then((value){
      if(value != null)
        favoritesData = FavoritesData.fromJson(value.data);
      printFullText(value!.data.toString());

    }).catchError((error){

    });

    update();

  }


}