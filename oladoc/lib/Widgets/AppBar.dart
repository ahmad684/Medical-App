import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Screens/MainScreen.dart';
AppBar customAppBar({
  Widget? actionw,

  String? title
}){
  return AppBar(
    elevation: 1,
    leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: AppColors.black,),onPressed: (){
      Get.back();
    },),
    title:Text(title!,style: TextStyle(color: AppColors.kTextColor),),
    centerTitle: true,

    actions: [



    ],

  );
}