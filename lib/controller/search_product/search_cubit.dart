import 'package:ecomerce/controller/search_product/search_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
class SearchProductCubit extends Cubit<SearchProductState>{
  SearchProductCubit():super(SearchInitial());
  TextEditingController textEditingController=TextEditingController();
  List<ProductModel>products=[];
  Future<void>searchProduct(String text)async{
    emit(SearchLoadingState());
    try{
      var response= await DioHelper.postData(endPoint: EndPoint.searchProductEndPoint);
      response.data['data']['data'].forEach((e){
        products.add(ProductModel.fromJson(e));
      });
      emit(SearchSuccedState());
    }catch(e){
      emit(SearchErrorState(e.toString()));
    }

  }
}