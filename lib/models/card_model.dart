import 'package:ecomerce/models/product_model.dart';

class CartModel {
  int id;
  int quantity;
  ProductModel productModel;

  CartModel(
      {required this.id, required this.productModel, required this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        productModel: ProductModel.fromJson(json['product']),
        quantity: json['quantity']);
  }
}
