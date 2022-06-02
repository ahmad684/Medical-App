import 'package:flutter/material.dart';
import 'package:oladoc/Constants/Colors.dart';

Container SearchTextField(){
  return  Container(
    height: 60,

    color: AppColors.white,
    child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5),
          prefixIcon: Icon(Icons.search,color: AppColors.customgray,),
          hintText: 'Doctors,disease,specialist..',hintStyle: TextStyle(
            color: AppColors.customgray
        ),

          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.customgray,
                width: 2
            ),



            borderRadius: BorderRadius.circular(5),


          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.gray,
              width: 1,
            ),
          ),


        )),
  );
}