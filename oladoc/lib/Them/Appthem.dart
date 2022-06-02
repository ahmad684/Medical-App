import 'package:flutter/material.dart';
import 'package:oladoc/Constants/Colors.dart';
ThemeData AppThemData(){
  return ThemeData(
      primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,

    )


  );


}