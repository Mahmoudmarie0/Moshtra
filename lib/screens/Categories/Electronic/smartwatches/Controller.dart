import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moshtra/models/smart_watches_model.dart';
import 'package:moshtra/service/home_service.dart';

class SmartWatchesController extends GetxController {
ValueNotifier<bool>get loading=>_loading;
ValueNotifier<bool>_loading=ValueNotifier(false);

List <SmartWatchesModel> get smartwatchesModel=>_smartwatchesModel;
List <SmartWatchesModel> _smartwatchesModel=[];

SmartWatchesController(){
  getSmartWatches();
}


getSmartWatches()async {
  _loading.value = true;
  HomeService().getSmartWatches().then((value) {
    for (int i = 0; i < value.length; i++) {
      _smartwatchesModel.add(SmartWatchesModel.fromJson(value[i].data()as Map));
      _loading.value = false;
    }
    update();
  });
}}