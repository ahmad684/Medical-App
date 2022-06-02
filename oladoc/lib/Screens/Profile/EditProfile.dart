import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Screens/MainScreen.dart';
import 'package:oladoc/Widgets/AppBar.dart';
bool _isMale=false;
bool _isFemale=false;
class EditProfile extends StatefulWidget {

  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController age=TextEditingController();
  var gender='';
  GetDate()async{
    final ds=
    await firestore.collection('Users').doc(auth.currentUser!.uid).get().then((value) {
      setState(() {
        name.text=value['UserName'];
        email.text=value['email'];
        age.text=value['Age'].toString();
        value['gender']=='Male'?_isMale==true:_isFemale==true;




        // print(ds['userName']);

      });
    });


  }
  void updateData(String id)async {
    Timestamp timestamp = Timestamp.now();
    await firestore
        .collection('Users')
        .doc(id)
        .update({
      'UserName': name.text,
      'email': email.text,

      'Age': int.parse(age.text,)
      ,'gender':gender
    });
    Get.off(()=>MainScreen());
  }
  @override
  void initState() {
    GetDate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: 'Edit Profile'
      ),
      body: Form(
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
                    gender='Male';
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
                      gender='Female';
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
      bottomSheet:  Padding(
          padding:  EdgeInsets.all(0),
          child: GestureDetector(
            onTap: (){
              updateData(auth.currentUser!.uid);
            },
            child: Container(

              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.mediumSlateBlue
              ),
              child: Center(child: Text('Update Profile',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
          )
      ));

  }
}
