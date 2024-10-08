class ProductModel {
  int id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String discription;
  bool inFavourites;
  bool inCart;
  List<String>? images;

  ProductModel(
      {required this.discount,
        required this.discription,
        required this.id,
        required this.image,
        required this.inCart,
        required this.inFavourites,
        required this.name,
        required this.oldPrice,
        required this.price,
        this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        discription: json['description'],
        inCart: json['inCart'] ?? false,
        inFavourites: json['in_favorites'] ?? false,
        images: json['images'] != null
            ? List<String>.from(json['images'].map((x) => x))
            : null);
  }
}
