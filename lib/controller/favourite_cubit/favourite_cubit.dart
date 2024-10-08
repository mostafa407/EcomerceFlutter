import 'package:dio/dio.dart';
import 'package:ecomerce/controller/favourite_cubit/favourite_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState>{
  FavouriteCubit():super(FavouriteIntial());
  Future<void>favouriteTogle(int id)async{
    emit(FavouriteLoadingState());
    try{
      var response=await DioHelper.postData(endPoint:
      EndPoint.favoritesEndPoint,mapData: {"product_id":id});
      print(response.data);
      if(response.data['status']){
        emit(FavouriteSateSucceed(response.data['message']));
      }else{
        emit(FavouriteErrorState());
      }
    }catch(e){
      emit(FavouriteErrorState());
    }
  }
}