import 'package:ecomerce/controller/SignUp_cubit/signup_cubit.dart';
import 'package:ecomerce/controller/login_cubit/login_cubit.dart';
import 'package:ecomerce/core/helpers/validator_helper/validator_helper.dart';
import 'package:ecomerce/views/screen/layout/layout.dart';
import 'package:ecomerce/views/screen/signUp/signUp.dart';
import 'package:ecomerce/views/widget/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: cubit.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 34)),
                const SizedBox(
                  height: 30,
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
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return CustomTextForm(
                      controller: cubit.passController,
                      funcValidator: (value) {
                        if (value!.isEmpty) {
                          return "please Enter valid pass";
                        }
                        return null;
                      },
                      hintText: "password",
                      iconData:Icons.lock,
                      isPassword: true,
                      isObsecure: cubit.isObsecure,
                      changeVisibality: () {
                        cubit.chnageObsecure();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => SignUpCubit(),
                              child: const SignUpScreen(),
                            );
                          },
                        ));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Create Account"),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot your password? "),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    } else if (state is LoginSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("login success")));

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LayoutScreen();
                        },
                      ));
                    }
                  },
                  builder: (context, state) {
                    return state is LoginLoadingState
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : ElevatedButton(
                        onPressed: () {
                          if (cubit.globalKey.currentState!.validate()) {
                            print("test");
                            cubit.login(cubit.emailController.text,
                                cubit.passController.text);
                          }
                        },
                        child: const Text('Login'));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

    //   Scaffold(
    //   body: SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.all(18.0),
    //         child: Form(
    //             child: Column(
    //               key: cubit.globalKey,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   "Login",
    //                   style: TextStyle(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 34),
    //                 ),
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 CustomTextForm(
    //                     hintText: "Email",
    //                     controller: cubit.emailController,
    //                     funcValidator: (value) {
    //                       if (value!.isEmpty) {
    //                         return "please enter valid email";
    //                       } else if (isValidEmail(value)) {
    //                         return "please enter valid email";
    //                       }
    //                       return null;
    //                     },
    //                     iconData: Icons.email),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 // BlocBuilder<LoginCubit, LoginState>(
    //                 //   builder: (context, state) {
    //                 //     return CustomTextForm(
    //                 //       hintText: "password",
    //                 //       controller: cubit.passController,
    //                 //       funcValidator: (value) {
    //                 //         if (value!.isEmpty) {
    //                 //           return "please enter valid password";
    //                 //         }
    //                 //         return null;
    //                 //       },
    //                 //       iconData: Icons.lock,
    //                 //       isPassword: true,
    //                 //       isObsecure: cubit.isObsecure,
    //                 //       changeVisibality: () {
    //                 //         cubit.chnageObsecure();
    //                 //       },
    //                 //     );
    //                 //   },
    //                 // ),
    //                 BlocBuilder<LoginCubit, LoginState>(
    //                   builder: (context, state) {
    //                     return CustomTextForm(
    //                       controller: cubit.passController,
    //                       funcValidator: (value) {
    //                         if (value!.isEmpty) {
    //                           return "please Enter valid pass";
    //                         }
    //                         return null;
    //                       },
    //                       hintText: "password",
    //                       iconData:Icons.lock,
    //                       isPassword: true,
    //                       isObsecure: cubit.isObsecure,
    //                       changeVisibality: () {
    //                         cubit.chnageObsecure();
    //                       },
    //                     );
    //                   },
    //                 ),
    //
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     // InkWell(
    //                     //   onTap: () {
    //                     //     Navigator.push(context, MaterialPageRoute(
    //                     //       builder: (context) {
    //                     //         return BlocProvider(
    //                     //           create: (context) => SignUpCubit(),
    //                     //           child: const SignUpScreen(),
    //                     //         );
    //                     //       },
    //                     //     ));
    //                     //   },
    //                     //   child: const Row(
    //                     //     mainAxisAlignment: MainAxisAlignment.end,
    //                     //     children: [
    //                     //       Text("Create Account"),
    //                     //     ],
    //                     //   ),
    //                     // ),
    //                     InkWell(
    //                       onTap: () {},
    //                       child: const Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Text("Forgot your password? "),
    //                           Icon(
    //                             Icons.arrow_forward,
    //                             color: Colors.red,
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 // BlocConsumer<LoginCubit, LoginState>(
    //                 //   builder: (context, state) {
    //                 //     return state is LoginLoadingState
    //                 //         ? Center(
    //                 //       child: CircularProgressIndicator(),
    //                 //     )
    //                 //         : ElevatedButton(
    //                 //         onPressed: () {
    //                 //           if (cubit.globalKey.currentState!.validate()) {
    //                 //             cubit.login(cubit.emailController.text,
    //                 //                 cubit.passController.text);
    //                 //           }
    //                 //         },
    //                 //         child: Text("Login"));
    //                 //   },
    //                 //   listener: (context, state) {
    //                 //     if (state is LoginErrorState) {
    //                 //       ScaffoldMessenger.of(context)
    //                 //           .showSnackBar(SnackBar(content: Text(state
    //                 //           .message)));
    //                 //     } else if (state is LoginLoadingState) {
    //                 //       ScaffoldMessenger.of(context).showSnackBar(
    //                 //           SnackBar(content: Text("login Succesful")));
    //                 //       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //                 //         return LayoutScreen();
    //                 //       },));
    //                 //     }
    //                 //   },
    //                 // )
    //                 BlocConsumer<LoginCubit, LoginState>(
    //                   listener: (context, state) {
    //                     if (state is LoginErrorState) {
    //                       ScaffoldMessenger.of(context)
    //                           .showSnackBar(SnackBar(content: Text(state.message)));
    //                     } else if (state is LoginSuccessState) {
    //                       ScaffoldMessenger.of(context).showSnackBar(
    //                           const SnackBar(content: Text("login success")));
    //
    //                       Navigator.push(context, MaterialPageRoute(
    //                         builder: (context) {
    //                           return LayoutScreen();
    //                         },
    //                       ));
    //                     }
    //                   },
    //                   builder: (context, state) {
    //                     return state is LoginLoadingState
    //                         ? const Center(
    //                       child: CircularProgressIndicator(),
    //                     )
    //                         : ElevatedButton(
    //                         onPressed: () {
    //                           if (cubit.globalKey.currentState!.validate()) {
    //                             print("test");
    //                             cubit.login(cubit.emailController.text,
    //                                 cubit.passController.text);
    //                           }
    //                         },
    //                         child: const Text('Login'));
    //                   },
    //                 )
    //
    //               ],
    //             )),
    //       )),
    // );
  }
}
