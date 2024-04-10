import 'dart:ui';

class Cart {

  final String name , image , price , productId , userId , quantity , description , Sized , sub_description;
  //final String color;


  Cart(this.name, this.image, this.price, this.productId, this.userId, this.quantity , this.Sized , /*this.color , */ this.sub_description , this.description);

  factory Cart.fromJson(jsonData) {
    return Cart(
      jsonData['name'],
      jsonData['image'],
      jsonData['price'],
      jsonData['productId'],
      jsonData['userId'],
      jsonData['quantity'],
      jsonData['description'],
      jsonData['sub_description'],
      jsonData['Sized'],
      //jsonData['color']
    );
  }


}