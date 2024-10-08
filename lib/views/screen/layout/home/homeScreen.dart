import 'package:ecomerce/controller/product_cubit/product_cubit.dart';
import 'package:ecomerce/controller/product_cubit/product_state.dart';
import 'package:ecomerce/views/widget/custom_appbar_Home.dart';
import 'package:ecomerce/views/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBarHomePage(),
        BlocProvider(
          create: (context) => ProductCubit()..getProduct(),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is ProductErrorState) {
                return SliverToBoxAdapter(
                  child: Text(state.message),
                );
              } else if (state is ProductSuccessState) {
                return SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 150 / 260,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10),
                    itemCount: context.read<ProductCubit>().productModel.length,
                    itemBuilder: (context, index) {
                    return CustomCardProduct(
                      productModel:
                          context.read<ProductCubit>().productModel[index],
                    );
                  },
                );
              }
              return SizedBox();
            },
          ),
        )
      ],
    );
  }
}
