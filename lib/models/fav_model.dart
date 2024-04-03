class Fav {

  final String name , image , price , productId , userId;

  Fav(this.name, this.image, this.price, this.productId, this.userId);

  factory Fav.fromJson(jsonData) {
    return Fav(
        jsonData['name'],
        jsonData['image'],
        jsonData['price'],
        jsonData['productId'],
        jsonData['userId']
    );
  }

}
