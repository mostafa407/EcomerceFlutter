import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecomerce/controller/SignUp_cubit/signup_cubit.dart';
import 'package:ecomerce/controller/SignUp_cubit/signup_state.dart';
import 'package:ecomerce/controller/login_cubit/login_cubit.dart';
import 'package:ecomerce/core/helpers/validator_helper/validator_helper.dart';
import 'package:ecomerce/views/screen/layout/layout.dart';
import 'package:ecomerce/views/widget/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Form(
            key: cubit.globalKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SignUp",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 34)),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextForm(
                      hintText: "Name",
                      controller: cubit.nameController,
                      funcValidator: (value) {
                        if (value!.isEmpty) {
                          return "please Enter valid Name";
                        }
                        return null;
                      },
                      iconData: Icons.person),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextForm(
                    controller: cubit.emailController,
                    funcValidator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter valid Email";
                      } else if (!isValidEmail(value)) {
                        return "please Enter valid Email";
                      }
                      return null;
                    },
                    hintText: "Email",
                    iconData: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextForm(
                    controller: cubit.phoneController,
                    countryFlag: (CountryCode value) {
                      cubit.countryCode = value.code!;
                    },
                    funcValidator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter valid phone";
                      }
                      return null;
                    },
                    hintText: "Phone",
                    iconData: Icons.email,
                    keyboardType: TextInputType.phone,
                    isPhone: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return CustomTextForm(
                        funcValidator: (value) {
                          if (value!.isEmpty) {
                            return "please Enter valid pass";
                          }
                          return null;
                        },
                        hintText: "password",
                        iconData: Icons.lock,
                        isPassword: true,
                        isObsecure: cubit.isObsecure,
                        changeVisibality: () {
                          cubit.chnageObsecure();
                        },
                        controller: cubit.passController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Text("Already have an account?"),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<SignUpCubit,SignUpState>(builder: (context, state) {
                    return state is SignUpLoadingState ? Center(
                      child: CircularProgressIndicator(),) : ElevatedButton(
                        onPressed: () {
                          if (cubit.globalKey.currentState!.validate()) {
                            cubit.signUp(name: cubit.nameController.text,
                                email: cubit.emailController.text,
                                pass: cubit.passController.text,
                                phoneNumber: cubit.phoneController.text);
                          }
                        }, child: Text("Sign Up"));
                  }, listener: (context, state) {
                  if(state is SignUpErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                  }else if (state is SignUpSuccessState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success create account")));
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                      return LayoutScreen();
                    },), (route) {
                      return false;
                    },);
                  }
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
