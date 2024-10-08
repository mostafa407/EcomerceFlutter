import 'package:bloc/bloc.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_detailed_state.dart';

class ProductDetailedCubit extends Cubit<ProductDetailedState> {

  ProductDetailedCubit() : super(ProductDetailedInitial());
  ProductModel? productModel;
  Future<void>getProduct(int id)async{
    try{
        emit(ProductDetailedLoading());
        var response= await DioHelper.getData(endPoint: '${EndPoint.productsEndPoint}/$id');
        print(response.data);
        productModel=ProductModel.fromJson(response.data['data']);
        emit(ProductDetailedSuccess());
    }catch(e){
      emit(ProductDetailedError());
    }
  }
}
