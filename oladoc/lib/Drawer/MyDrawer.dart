import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Screens/MainScreen.dart';
import 'package:oladoc/Screens/Profile/CompleteProfile.dart';
import 'package:oladoc/Screens/Profile/EditProfile.dart';
Drawer MyDrawer(String name,double percentage ){
  return Drawer(

    child: ListView(
      children: [
        Container(
          color: AppColors.mediumSlateBlue,

          width: 40,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(name,style: TextStyle(color: AppColors.white),),
              SizedBox(height: 5,),
              Text('0309-4456789',style: TextStyle(color: AppColors.white),),
              SizedBox(height: 10,),
              GFProgressBar(
                backgroundColor: AppColors.scaffoldBackgroundColor,
                progressBarColor: Colors.green,
                percentage: name=='unknown'?0.5:percentage,
                lineHeight: 10
                ,
                padding: EdgeInsets.only(left: 15,right: 15),
                trailing:  Text('${(name=='unknown'?0.5:percentage/1)*100}%',style: TextStyle(color: AppColors.white),),
              ),
              SizedBox(height: 10,),
              GestureDetector(onTap: () {

              Get.to(()=>name=="unknown"?Completeprfile():EditProfile());


              },
                child: Container(


                  decoration: BoxDecoration(
                      color: AppColors.transparent,
                      border: Border.all(
                          color: AppColors.white,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(2)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(child: Text(name!='unknown'?'Edit Profile':'Complete Profile',style: TextStyle(color: AppColors.white),)),
                  ),

                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
        drawerTile('My Profile',(){}),
        Divider(thickness: 1,),
       drawerTile('Recent Doctors',(){}),
        Divider(thickness: 1,),
        drawerTile('Wallet',(){}),
        Divider(thickness: 1,),

        drawerTile('refer a Friend',(){}),
        Divider(thickness: 1,),
        drawerTile('Logout',(){
          FirebaseAuth.instance.signOut();
          Get.off(()=>MainScreen());
        }),
        Divider(thickness: 1,),
      ],
    ),
  );
}
Widget drawerTile(String title,OnTap){
  return Container(
    height: 40,
    child: ListTile(
      onTap: OnTap,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    ),
  );

}
