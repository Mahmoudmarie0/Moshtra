
class BannerModel{
  String ?Image;


  BannerModel({
    this.Image,

  });

//taking map coming from firebase
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