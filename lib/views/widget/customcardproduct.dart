import 'package:ecomerce/controller/addcart_cubit/add_cart_cubit.dart';
import 'package:ecomerce/controller/addcart_cubit/add_cart_state.dart';
import 'package:ecomerce/views/screen/product_detailed/product_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product_model.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailed(
              id: productModel.id,
            );
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image(
                      image: NetworkImage(productModel.image),
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => AddCardCubit(),
                    child: BlocConsumer<AddCardCubit, AddCardState>(
                      listener: (context, state) {
                        if (state is AddCardProductSucess) {
                          if (state.message == "Deleted Successfully") {
                            productModel.inCart = false;
                          } else {
                            productModel.inCart = true;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        }
                      },
                      builder: (context, state) {
                        var cubit = context.read<AddCardCubit>();
                        if (state is AddCardProductLoading) {
                          return const Align(
                            alignment: Alignment.bottomLeft,
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            cubit.addProduct(productModel.id);
                          },
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: productModel.inCart
                                ? CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.shop,
                                color: Colors.white,
                              ),
                            )
                                : CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            ignoreGestures: true,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "(3)",
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        productModel.name,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        productModel.discription,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${productModel.price}\$',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
