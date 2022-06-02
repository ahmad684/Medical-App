import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/Colors.dart';
import '../../Widgets/AppBar.dart';

class SelectLocaton extends StatelessWidget {
  const SelectLocaton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppBar(
            title: 'Search Location'
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,

                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(heigth*0.01),
                  child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 5),
                        prefixIcon: Icon(Icons.search,color: AppColors.customgray,),
                        hintText: 'search for locality or city',hintStyle: TextStyle(
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
                ),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16,left: 8,bottom: 16,right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Use Current Location',style: TextStyle(color: AppColors.mediumSlateBlue,fontSize: 18,fontWeight: FontWeight.bold),),
                          Icon(Icons.my_location_outlined,color: AppColors.mediumSlateBlue,)
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Cities',style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    CityTile('Lahore'),
                    Divider(),
                    CityTile('Karachi'),
                    Divider(),  CityTile('Islamabad'),
                    Divider(),
                    CityTile('Faislabad'),
                    Divider(),
                    CityTile('Rawalpindi'),
                    Divider(),  CityTile('Multan'),
                    Divider(),
                    CityTile('Gujranwala'),
                    Divider(),
                    CityTile('Bahawalpur'),
                    Divider(),
                    CityTile('Pishawer')
                  ,
                  ],
                ),
              ),







            ],
          ),
        )
    );
  }
  }
Widget CityTile(String title){
  return  GestureDetector(
    child: Container(
      color: AppColors.white,
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,style: TextStyle(fontSize: 16),),
      ),

    ),
  );
  
}