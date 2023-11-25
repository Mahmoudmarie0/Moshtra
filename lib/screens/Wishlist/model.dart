class FavoritesModel {

  bool? status;
  dynamic message;
  Data? data;

  FavoritesModel.fromJson(Map<String , dynamic> json){

    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;

  }
}

class Data {

  int? currentPage;
  List<FavoritesData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;


  Data.fromJson(Map<String , dynamic> json){
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    prevPageUrl = json['prev_page_url'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];

    if(json['data'] != null){
      json['data'].forEach(
              (v){
            data?.add(new FavoritesData.fromJson(v));
          }
      );
    }




  }


}

class FavoritesData {

  int? id;
  Product? product;

  FavoritesData.fromJson(Map<String , dynamic> json){

    id = json['id'];
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

}

class Product {

  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description
  });

  Product.fromJson(Map<String , dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}