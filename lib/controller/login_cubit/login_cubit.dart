import 'package:ecomerce/controller/login_cubit/login_state.dart';
import 'package:ecomerce/core/constants/end_point.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/models/login_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isObsecure = true;

  void chnageObsecure() {
    isObsecure = !isObsecure;
    emit(ChangeObsecureLoginState());
  }

  UserModel? userModel;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoint.LoadingEndPoint,
          mapData: {"email": email, "password": password});
      print(response.data);
      if (response.data['status']) {
        userModel = UserModel.fromJson(response.data['data']);
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(response.data['message']));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
