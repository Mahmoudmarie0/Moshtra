
class BannerModel{
  String ?Image;


  BannerModel({
    this.Image,

  });


  BannerModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    Image=map['Image'];

  }

  toJson(){
    return{

      'Image':Image,

    };

  }}