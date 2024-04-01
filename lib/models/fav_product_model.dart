class FavProductModel{
  String ?name ,image , price ,productId;

  FavProductModel({
    this.name,
    this.image,
    this.price,
    this.productId
  });


  FavProductModel.fromJson(Map<dynamic,dynamic>map){
    name=map['name'];
    image=map['image'];
    productId = map['productId'];
    price=map['price'];


  }

  toJson(){
    return{
      'name':name,
      'image':image,
      'price':price,
      'productId': productId,
    };

  }}