class Fav {

  final String name , image , price , productId , userId ,  description , Sized , sub_description ;

  Fav(this.name, this.image, this.price, this.productId, this.userId ,  this.Sized , /*this.color , */ this.sub_description , this.description);

  factory Fav.fromJson(jsonData) {
    return Fav(
      jsonData['name'],
      jsonData['image'],
      jsonData['price'],
      jsonData['productId'],
      jsonData['userId'],
      jsonData['description'],
      jsonData['sub_description'],
      jsonData['Sized'],
    );
  }

}