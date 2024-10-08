import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:ecomerce/controller/addcart_cubit/add_cart_cubit.dart';
import 'package:ecomerce/controller/cart/cartCubit.dart';
import 'package:ecomerce/controller/cart/cartState.dart';
import 'package:ecomerce/models/add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddCart extends StatelessWidget {
  const AddCart({super.key,required this.addCartModel});
  final AddCartModel addCartModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AddCardCubit()..addProduct(addCartModel.id),
    child: Scaffold(
        body: BlocBuilder<CartCubit,CartState>(builder: (context, state) {
          return AnimatedConditionalBuilder(condition: state is CartSucessState,
              builder: (context) {
                return Column(
                  children: [
                    Text("My bag")
                  ],
                );
              }, fallback: (context) {
                return Center(child: CircularProgressIndicator(),);
              },);
        },),
    ),
    );
  }
}
