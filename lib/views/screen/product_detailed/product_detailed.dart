import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/controller/favourite_cubit/favourite_cubit.dart';
import 'package:ecomerce/controller/favourite_cubit/favourite_state.dart';
import 'package:ecomerce/controller/productDetailed/product_detailed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailed extends StatelessWidget {
  const ProductDetailed({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailedCubit()..getProduct(id),
      child: BlocConsumer<ProductDetailedCubit, ProductDetailedState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<ProductDetailedCubit>();
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              ElevatedButton(onPressed: () {}, child: Text('Add To Cart')),
            ),
            // bottomSheet: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child:
            //       ElevatedButton(onPressed: () {}, child: Text('Add To Cart')),
            // ),
            appBar: AppBar(),
            body: AnimatedConditionalBuilder(
              duration: Duration(seconds: 1),
              condition: state is ProductDetailedSuccess,
              builder: (_) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(height: 300.0),
                      items: cubit.productModel!.images!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.cover)),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.productModel!.name,
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                          Row(
                            children:
                            [
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
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              BlocProvider(
                                create: (context) => FavouriteCubit(),
                                child: BlocConsumer<FavouriteCubit,
                                    FavouriteState>(
                                  listener: (context, state) {
                                    if (state is FavouriteLoadingState) {
                                      context
                                          .read<ProductDetailedCubit>()
                                          .productModel!
                                          .inFavourites =
                                      !context
                                          .read<ProductDetailedCubit>()
                                          .productModel!
                                          .inFavourites;
                                    } else if (state is FavouriteErrorState) {
                                      context
                                          .read<ProductDetailedCubit>()
                                          .productModel!
                                          .inFavourites =
                                      !context
                                          .read<ProductDetailedCubit>()
                                          .productModel!
                                          .inFavourites;
                                    } else if (state is FavouriteSateSucceed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text(state.message)));
                                    }
                                  },
                                  builder: (context, state) {
                                    var favouriteCubit =
                                    context.read<FavouriteCubit>();
                                    return GestureDetector(
                                      onTap: () {
                                        favouriteCubit.favouriteTogle(id);
                                      },
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 5,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          child: context
                                              .read<ProductDetailedCubit>()
                                              .productModel!
                                              .inFavourites
                                              ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                              : Icon(
                                            Icons.favorite_border,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '${cubit.productModel!.price}\$',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            cubit.productModel!.discription,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
