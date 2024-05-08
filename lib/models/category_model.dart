// class CategoriesModel{
//   dynamic status;
//   CategoriesDataModel? data;
//   CategoriesModel.fromJson(Map<String,dynamic>json){
//     status=json['status'];
//     data=CategoriesDataModel.fromJson(json['data']);
//   }
//
//
// }
// class CategoriesDataModel{
//   dynamic current_page;
//   List<DataModel> data=[];
//   CategoriesDataModel.fromJson(Map<String,dynamic>json){
//     current_page=json['current_page'];
//     json ['data'].forEach((element){
//       data.add(DataModel.fromJson(element));
//     });
//   }
// }
// class DataModel{
//   dynamic id;
//   dynamic name;
//   dynamic image;
//   DataModel.fromJson(Map<String,dynamic>json){
//     id=json['id'];
//     name=json['name'];
//     image=json['image'];
//   }
//
// }
import 'package:moshtra/models/electronics_model.dart';
import 'package:moshtra/models/smart_watches_model.dart';

class CategoryModel {
  ElectronicsModel ? electronicsModel;
  SmartWatchesModel? smartWatchesModel;
  String ? nameAR, nameEN, image;

  CategoryModel({ this.nameAR, this.nameEN, this.image,this.electronicsModel,this.smartWatchesModel});

  CategoryModel.fromJson(Map<dynamic, dynamic>map){
    nameAR = map['nameAR'];
    nameEN = map['nameEN'];
    image = map['image'];
    electronicsModel=map['Electronics'];
    smartWatchesModel=map['SmartWatches'];
  }

  //return directly of name and image
  toJson() {
    return {
      'nameAR': nameAR,
      'nameEN': nameEN,
      'image': image,

    };
  }
}











