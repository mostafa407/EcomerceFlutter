import 'package:ecomerce/controller/product_cubit/product_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(ProductInitialState());
  List<ProductModel> productModel=[];
  Future<void> getProduct()async{
    emit(ProductLoadingState());
    try{
      var response= await DioHelper.getData(endPoint: EndPoint.productsEndPoint);
      print(response.data);
      response.data['data']['data'].forEach((e){
          productModel.add(ProductModel.fromJson(e));
      });
      emit(ProductSuccessState());
    }catch (e){
      print(e.toString());
      emit(ProductErrorState(e.toString()));
    }
  }

}

