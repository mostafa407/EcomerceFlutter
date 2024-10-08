import 'package:dio/dio.dart';
import 'package:ecomerce/controller/SignUp_cubit/signup_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/cash_helper/cash_helper.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit():super(SignUpInitialState());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  String countryCode = "+20";
  bool isObsecure = true;
  void chnageObsecure() {
    isObsecure = !isObsecure;
    emit(ChnageObsecureSignUpState());
  }

  UserModel? userModel;

  Future<void> signUp(
      {required String name,
        required String email,
        required String pass,
        required String phoneNumber}) async {
    emit(SignUpLoadingState());

    try {
      Response response =
      await DioHelper.postData(endPoint: EndPoint.signUpEndPoint, mapData: {
        "name": name,
        "phone": countryCode + phoneNumber,
        "email": email,
        "password": pass,
      });
      print(response.data);
      if (response.data['status']) {
        userModel = UserModel.fromJson(response.data['data']);
        await CashHelper.setString(
            key: CashHelper.tokenKey, value: userModel!.token);
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState(response.data['message']));
      }
    } catch (e) {
      print(e);
      emit(SignUpErrorState(e.toString()));
    }
  }
}