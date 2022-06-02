import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Screens/Auth/OTP.dart';
import 'package:oladoc/Widgets/AppBar.dart';
class MobileLogin extends StatefulWidget {

  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
Color buttonColor=Colors.black45;
String buttonText='Enter Number';
var phone;
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: 'Login',

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width*0.05,top: heigth*0.05,right: width*0.05),
              child: Text('Enter Your Phone Number',style: TextStyle(
                  color: AppColors.black,fontSize: 29
              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width*0.05,top: heigth*0.02,right: width*0.05),
              child: Text('We share this information with doctor',style: TextStyle(
                  color: AppColors.gray,fontSize: 18
              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width*0.05,top: heigth*0.02,right: width*0.05),
              child: Text('Phone Number',style: TextStyle(
                  color: AppColors.black,fontSize: 18
              ),),
            ),
            Padding(
                padding:  EdgeInsets.only(left: width*0.05,top: heigth*0.02,right: width*0.05),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phon) {

                   setState(() {
                     phone=phon;
                     buttonText='Login';
                     buttonColor=AppColors.orangeDark;
                   });
                  },
                )
            ),
            SizedBox(height: heigth*0.5,)

          ],
        ),
      ),
      bottomSheet:  Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: GestureDetector(
            onTap: (){
              Get.to(()=>OTPScreen(phone));
            },
            child: Container(


              height: heigth*0.09,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buttonColor
              ),
              child: Center(


                  child: Text(buttonText,style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)


              ),
            ),
          ))
      ,

    );
  }
}
