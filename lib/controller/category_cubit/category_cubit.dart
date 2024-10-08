import 'package:ecomerce/controller/category_cubit/category_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/category,dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit():super(CategoryInitState());
  List<CategoryModel> categoryModel=[];
  Future<void>getCategory()async{
    emit(CategoryLoadingState());
        try{
          var response=await DioHelper.postData(endPoint: EndPoint.categoriesEndPoint);
           print(response.data);
           response.data['data']['data'].forEach((e){
             categoryModel.add(CategoryModel.fromJson(e));

           });
           emit(CategorySuccessState());
        }catch(e){
          emit(CategoryErrorState(e.toString()));
        }
  }
}