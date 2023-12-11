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
class ElectronicsModel{
  String ? name,image;
  ElectronicsModel({ this.name, this.image});
  ElectronicsModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
  }
  //return directly of name and image
  toJson(){
    return{
      'name':name,
      'image':image,
    };

  }

  }
