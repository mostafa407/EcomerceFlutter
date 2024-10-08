import 'package:ecomerce/controller/cart/cartCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CartCubit()..getCartUser(),
    child: BlocConsumer(builder: (context, state) {
      return Placeholder();

    }, listener: (context, state) {

    },),
    );
  }
}
