import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_cart_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit() : super(AddCardInitial());

  Future<void> addProduct(int productID) async {
    emit(AddCardProductLoading());
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoint.carts, mapData: {"product_id": productID});
      if (response.data['status']) {
        print(response.data);
        emit(AddCardProductSucess(response.data['message']));
      } else {
        emit(AddCardProductError(response.data['message']));
      }
    } catch (e) {
      emit(AddCardProductError(e.toString()));
    }
  }
}
