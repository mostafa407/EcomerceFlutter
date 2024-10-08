import 'package:flutter/material.dart';

class CustomAppBarHomePage extends StatelessWidget {
  const CustomAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      primary: true,
      title: Text(
        "Street clothes",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      pinned: true,
      flexibleSpace: Image(image: AssetImage('assets/images/Small banner.png'),fit: BoxFit.cover,),
    );

  }
}
