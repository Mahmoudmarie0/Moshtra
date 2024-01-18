class CartProductModel{
  String ?name ,image , price ,productId;
  int? quantity;

  CartProductModel({
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.productId
  });


  CartProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    productId = map['productId'];
    price=map['price'];
    quantity = map['quantity'];

  }

  toJson(){
    return{
      'name':name,
      'image':image,
      'quantity': quantity,
      'price':price,
      'productId': productId,
    };

  }}