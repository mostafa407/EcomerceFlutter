import 'package:flutter/material.dart';
class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SUMMER SALES",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text("Up TO 50% off",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
