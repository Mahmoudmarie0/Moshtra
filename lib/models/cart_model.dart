class Cart {

  final String name , image , price , productId , userId;
  final String quantity;


  Cart(this.name, this.image, this.price, this.productId, this.userId, this.quantity);

  factory Cart.fromJson(jsonData) {
    return Cart(
        jsonData['name'],
        jsonData['image'],
        jsonData['price'],
        jsonData['productId'],
        jsonData['userId'],
        jsonData['quantity']
    );
  }

}