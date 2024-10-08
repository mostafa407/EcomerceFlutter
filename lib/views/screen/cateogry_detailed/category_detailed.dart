import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:ecomerce/controller/category_detailed/category_deailed_state.dart';
import 'package:ecomerce/controller/category_detailed/category_detailed_cubit.dart';
import 'package:ecomerce/models/category,dart.dart';
import 'package:ecomerce/views/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    CategoryDetilesCubit()
      ..getProductDetails(categoryModel.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryModel.name),
        ),
        body: BlocBuilder<CategoryDetilesCubit, CategoryDetilesState>(
          builder: (context, state) {
            var cubit = context.read<CategoryDetilesCubit>();
            return AnimatedConditionalBuilder(
                condition: state is CategoryDetilsSuccessState,
                builder: (context) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 150/260,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2
                        , mainAxisSpacing: 10,
                      ), itemBuilder: (context, index) {
                        return CustomCardProduct(productModel: cubit.products[index]);
                      },);
                }, fallback: (context) {
                  return CircularProgressIndicator();
                },);
          },),
      ),
    );
  }
}
