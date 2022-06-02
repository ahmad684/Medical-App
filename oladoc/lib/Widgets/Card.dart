import 'package:flutter/material.dart';
import 'package:oladoc/Constants/Colors.dart';
Container customCard(
    Widget? firstWiget,
    Widget? midleWiget,
    Widget? lastWiget
    ){
  return Container(

   decoration: BoxDecoration(
     color: AppColors.white,
     borderRadius: BorderRadius.circular(8)
   ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        firstWiget!,
        midleWiget!,
        lastWiget!

      ],
    ),


  );
}