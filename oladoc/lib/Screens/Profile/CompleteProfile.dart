import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Controllers/userController.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Screens/MainScreen.dart';

import '../../Constants/Colors.dart';
import '../../Widgets/AppBar.dart';


bool _isMale=false;
bool _isFemale=false;
class Completeprfile extends StatefulWidget {
  const Completeprfile({Key? key}) : super(key: key);

  @override
  State<Completeprfile> createState() => _CompleteprfileState();
}

class _CompleteprfileState extends State<Completeprfile> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController age=TextEditingController();
  String _gender='';
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppBar(
            title: 'Complete Profile'
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Name',style: TextStyle(fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: TextFormField(


                      controller: name,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mediumSlateBlue, width: 2.0),
                          ),
                          fillColor: AppColors.white,
                          filled: true,
                          hintText: 'Enter Name',

                          border: OutlineInputBorder(

                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Email',style: TextStyle(fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mediumSlateBlue, width: 2.0),
                          ),
                          fillColor: AppColors.white,
                          filled: true,
                          hintText: 'Enter Email',

                          border: OutlineInputBorder(

                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Age in years',style: TextStyle(fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mediumSlateBlue, width: 2.0),
                          ),
                          fillColor: AppColors.white,
                          filled: true,
                          hintText: 'Enter Age',

                          border: OutlineInputBorder(

                          )
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Gender',style: TextStyle(fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(onTap: (){
                        setState(() {
                          _isMale=true;
                          _isFemale=false;
                          _gender='Male';
                        });
                      }

                        ,
                        child: Container(
                          height: heigth*0.06,
                          width:width*0.45 ,
                          decoration: BoxDecoration(
                              color: _isMale?AppColors.white:AppColors.scaffoldBackgroundColor,
                              border: Border.all(
                                  color: _isMale?AppColors.mediumSlateBlue:AppColors.customgray
                              ),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('Male')),
                          ),

                        ),
                      ),
                      GestureDetector(onTap: (){
                        setState(() {
                          _isMale=false;
                          _isFemale=true;
                          _gender='Female';
                        });
                      }

                        ,
                        child: Container( 
                          height: heigth*0.06,
                          width:width*0.45 ,
                          decoration: BoxDecoration(
                              color: _isFemale?AppColors.white:AppColors.scaffoldBackgroundColor,
                              border: Border.all(
                                  color: _isFemale?AppColors.mediumSlateBlue:AppColors.customgray
                              ),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('Female')),
                          ),

                        ),
                      ),

                    ],),
                )
              ],
            ),
          ),
        ),
        bottomSheet:  Padding(
            padding:  EdgeInsets.all(0),
            child: GestureDetector(
              onTap: (){
                try{
                  UserData().setUserData(userName: name.text, userId: auth.currentUser!.uid, email: email.text, gender: _gender, phoneNumbe: auth.currentUser!.phoneNumber, age: int.parse(age.text));
                  Get.off(()=>MainScreen());
                }catch(e){
                  Get.snackbar('Error', e.toString());
                }



              },
              child: Container(

                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.mediumSlateBlue
                ),
                child: Center(child: Text('Complete Profile',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
            )
        ));

  }
}
