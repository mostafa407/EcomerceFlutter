import 'package:ecomerce/controller/category_detailed/category_deailed_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetilesCubit extends Cubit<CategoryDetilesState>{
  CategoryDetilesCubit():super(CategoryDetilesInitial());
  List<ProductModel> products=[];
  Future<void>getProductDetails(int categoryId)async{
    products=[];
    emit(CategoryDetailsLodaingState());
    try{
      var response=await DioHelper.getData(endPoint: '${EndPoint.categoriesEndPoint}/$categoryId');
      if(response.data['status']){
        response.data['data']['data'].forEach((e){
          products.add(ProductModel.fromJson(e));
        });
        emit(CategoryDetilsSuccessState());
      }else{
        emit(CategoryDetailsErrorState(response.data['message']));
      }
    }catch (e){
      emit(CategoryDetailsErrorState(e.toString()));
    }
  }
}