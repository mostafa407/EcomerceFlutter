import 'package:ecomerce/controller/category_cubit/category_cubit.dart';
import 'package:ecomerce/controller/category_cubit/category_state.dart';
import 'package:ecomerce/views/screen/search/search.dart';
import 'package:ecomerce/views/widget/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CategoryCubit()..getCategory(),
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Categories',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              },));

            },
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBannerWidget(),
            SizedBox(
             height:  20
            ),

          ],
        ),
      ),

    ),
    );
  }
}
