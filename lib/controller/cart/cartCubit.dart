import 'package:ecomerce/controller/cart/cartState.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/card_model.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cartModel = [];

  Future<void> getCartUser() async {
    emit(CartLoadingState());
    try {
      var response = await DioHelper.getData(endPoint: 'carts');

      response.data['data']['cart_items'].forEach((e) {
        cartModel!.add(CartModel.fromJson(e));
      });

      emit(CartSucessState());
    } catch (e) {
      print(e.toString());
      emit(CartErrorState());
    }
  }
}