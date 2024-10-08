import 'package:ecomerce/models/product_model.dart';

class AddCartModel {
  int id;
  int quantity;
  ProductModel productModel;

  AddCartModel(
      {required this.id, required this.productModel, required this.quantity});

  factory AddCartModel.fromJson(Map<String, dynamic> json) {
    return AddCartModel(
        id: json['id'],
        productModel: ProductModel.fromJson(json['product']),
        quantity: json['quantity']);
  }
}
