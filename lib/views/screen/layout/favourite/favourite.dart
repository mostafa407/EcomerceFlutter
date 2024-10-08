import 'package:ecomerce/controller/myFavourite_card/my_favourite_card_cubit.dart';
import 'package:ecomerce/controller/myFavourite_card/my_favourite_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/customcardproduct.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFavouriteProductCubit()..getFavourite(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourite'),
        ),
        body: BlocConsumer<MyFavouriteProductCubit, MyFavouriteProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<MyFavouriteProductCubit>();
            if (state is MyFavouriteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MyFavouriteSuccessState) {
              return GridView.builder(
                itemCount: cubit.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 260,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CustomCardProduct(productModel: cubit.products[index]);
                },
              );
            } else if (state is MyFavouriteErrorState) {
              return Text(state.message);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
