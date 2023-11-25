





import 'package:get/get.dart';
import 'package:moshtra/Dio/DioHelper.dart';

import 'package:moshtra/screens/Home/model.dart';
import 'package:moshtra/utils/constants/components.dart';

import 'package:moshtra/utils/constants/endpoints.dart';

import '../../Categories/model.dart';



class HomeController extends GetxController{
      HomeModel? homeModel;
      CategoriesModel? categoriesModel;



// @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getHomeData();
//     update();
//   }


  @override
  void onReady() {
    // TODO: implement onReady
    getHomeData();
    getCategoriesData();
    update();

  }
    void getHomeData(){
      DioHelper.getData(url: Endpoints.Home,
        token: token,
      ).then((value){
        if(value!=null)
        homeModel=HomeModel.fromJson(value.data);
        printFullText('${homeModel!.data!.banners[0].image}');
        if((homeModel!.status)!=null){
          print('yess');
        print(homeModel?.status);}
      }).catchError((error){
        print(error.toString());
      });
      update();

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



  // Widget products(HomeModel model,context)=> Column(
  //
  //   children: [
  //     CarouselSlider(items: model.data!.banners.map((e) =>
  //
  //         Image(
  //
  //           image:NetworkImage('${e.image}'),
  //
  //           width: double.infinity,
  //
  //           fit: BoxFit.cover,
  //
  //         ),).toList(),
  //
  //       options: CarouselOptions(
  //
  //         height: 250.0,
  //
  //         initialPage: 0,
  //
  //         viewportFraction:1.0 ,
  //
  //         enableInfiniteScroll: true,
  //
  //         reverse: false,
  //
  //         autoPlay: true,
  //
  //         autoPlayInterval: Duration(seconds: 3),
  //
  //         autoPlayAnimationDuration: Duration(seconds: 1),
  //
  //         autoPlayCurve: Curves.fastOutSlowIn,
  //
  //         scrollDirection: Axis.horizontal,
  //
  //
  //
  //
  //
  //       ),),
  //   ],
  // );


}