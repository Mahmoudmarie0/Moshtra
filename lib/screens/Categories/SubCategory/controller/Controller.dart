import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/models/smart_watches_model.dart';

import '../../../../models/products_model.dart';
import '../../../../service/home_service.dart';

class subcategoryController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ElectronicsModel> get electronicsModel => _electronicsModel;
  List<ElectronicsModel> _electronicsModel = [];


  List<ElectronicsModel> get CatProduct => _CatProduct;
  List<ElectronicsModel> _CatProduct = [];

  List<SmartWatchesModel> get smartwatchesModel => _smartwatchesModel;
  List<SmartWatchesModel> _smartwatchesModel = [];

  subcategoryController() {
    // getElectronics();
    // getSmartWatches();
  }

  getElectronics() async {
    _loading.value = true;
    HomeService().getElectronics().then((value) {
      for (int i = 0; i < value.length; i++) {
        _electronicsModel
            .add(ElectronicsModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  getSmartWatches() async {
    _loading.value = true;
    HomeService().getSmartWatches().then((value) {
      for (int i = 0; i < value.length; i++) {
        _smartwatchesModel
            .add(SmartWatchesModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  SubCatQuery() async {}
}
