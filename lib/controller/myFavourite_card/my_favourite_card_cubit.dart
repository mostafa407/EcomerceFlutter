import 'package:ecomerce/controller/myFavourite_card/my_favourite_card_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/cash_helper/cash_helper.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouriteProductCubit extends Cubit<MyFavouriteProductState>{
  MyFavouriteProductCubit():super(MyFavouriteProductInitial());
  List<ProductModel> products=[];
  Future<void>getFavourite()async{
    products=[];
    emit(MyFavouriteLoadingState());
    try {
      print(CashHelper.getString(key: CashHelper.tokenKey));
      var response =
      await DioHelper.getData(endPoint: EndPoint.favoritesEndPoint);
      if (response.data['status']) {
        response.data['data']['data'].forEach((e) {
          products.add(ProductModel.fromJson(e['product']));
        });

        emit(MyFavouriteSuccessState());
      } else {
        emit(MyFavouriteErrorState(response.data['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(MyFavouriteErrorState(e.toString()));
    }

  }
}