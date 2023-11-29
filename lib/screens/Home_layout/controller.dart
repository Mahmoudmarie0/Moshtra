
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../main.dart';

class HomeLayoutController extends GetxController
{



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sharedPref!.setBool('HomeLayout', true);
  }

  void SeeAll(){
    NavButtonSwitch(1);
    update();
  }




  bool bottom_Item_1_pressed = true;
  bool bottom_Item_2_pressed = false;
  bool bottom_Item_3_pressed = false;
  bool bottom_Item_4_pressed = false;
  bool bottom_Item_5_pressed = false;
  int? CurrentIndex=0;



  void changeIndex(int index){
    CurrentIndex=index;
    update();
  }
  void NavButtonSwitch(int index){

    if(index!=5) {
      changeIndex(index);
      if (index == 0) {
        if (bottom_Item_1_pressed) {}
        else {
          bottom_Item_1_pressed = true;
          bottom_Item_2_pressed = false;
          bottom_Item_3_pressed = false;
          bottom_Item_4_pressed = false;
          bottom_Item_5_pressed = false;
        }
      }
      else if (index == 1) {
        if (bottom_Item_2_pressed) {}
        else {
          bottom_Item_2_pressed = true;
          bottom_Item_3_pressed = false;
          bottom_Item_1_pressed = false;
          bottom_Item_4_pressed = false;
          bottom_Item_5_pressed = false;
        }
      }
      else if (index == 2) {
        if (bottom_Item_3_pressed) {}
        else {
          bottom_Item_3_pressed = true;
          bottom_Item_4_pressed = false;
          bottom_Item_5_pressed = false;
          bottom_Item_2_pressed = false;
          bottom_Item_1_pressed = false;
        }
      }
      else if (index == 3) {
        if (bottom_Item_4_pressed) {}
        else {
          bottom_Item_4_pressed = true;
          bottom_Item_3_pressed = false;
          bottom_Item_2_pressed = false;
          bottom_Item_1_pressed = false;
          bottom_Item_5_pressed = false;
        }
      }
      else if (index == 4) {
        if (bottom_Item_5_pressed) {}
        else {
          bottom_Item_5_pressed = true;
          bottom_Item_4_pressed = false;
          bottom_Item_3_pressed = false;
          bottom_Item_2_pressed = false;
          bottom_Item_1_pressed = false;
        }
      }
    }
  }















}