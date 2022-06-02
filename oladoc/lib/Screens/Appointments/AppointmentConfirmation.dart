import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Screens/MainScreen.dart';
import 'package:oladoc/Widgets/AppBar.dart';
class AppointmentConfirmation extends StatelessWidget {
  String? patientName;
  String? doctorName;
  String? appointmentTime;
  String? address;
  String? hospitalName;
  int? fee;

 AppointmentConfirmation({Key? key,this.appointmentTime,this.hospitalName,this.doctorName,this.fee,this.address,this.patientName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: AppColors.black,),onPressed: (){
          Get.back();
        },),
        title:Text('Appointment Details',style: TextStyle(color: AppColors.kTextColor),),
        centerTitle: true,

        actions: [
          TextButton(onPressed: (){
            Get.offAll(()=>MainScreen());
          }, child: Text('Done',style: TextStyle(color: AppColors.black),))



        ],

      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal,width: 5),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Icon(Icons.done,size:40,color: Colors.teal,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your in-Person Appointment hase been Booked!',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
            ),
            Container(
              width:width ,
              color: AppColors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width*0.05),
                    child: Text('Share Your Medical Records with DR.Ali',style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.center,),
                  ),
                  Padding(
                      padding:  EdgeInsets.only(left:width*0.08,right: width*0.08,bottom: width*0.08),
                      child: Container(


                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.orangeDark
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.medical_services,color: AppColors.white,),
                            SizedBox(width: 10,),
                            Text('Add Medical Records',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                  ),


                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width:width ,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.all(width*0.05),
                    child: Text('Appointment Details',style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.center,),
                  ),
                  Divider(color: AppColors.scaffoldBackgroundColor,thickness: 2,),
                  SizedBox(height: 15,),
                  Padding(
                      padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                    child: CustomRow(Icon(Icons.person), 'Patient Name', patientName!)
                  ),
                  Padding(
                      padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                    child: CustomRow(Icon(Icons.calendar_today_outlined), 'Appointment Time', appointmentTime!)
                  ),

                  Padding(
                      padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                    child: CustomRow(Icon(Icons.medical_services_outlined), 'Doctor Name', doctorName!+" at "+hospitalName!+" "+address!)
                  ),
                  Padding(
                      padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                    child: CustomRow(Icon(Icons.payment), 'Appointment Fee', 'Rs.$fee (To be pay at clinic)')
                  ),



                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
Widget CustomRow(Icon icon,String title,String subtitle){
  return Row(
    children: [
      icon,
      SizedBox(width: 20,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,style: TextStyle(
              color: AppColors.customgray,
          ),
            textAlign: TextAlign.start,


          ),
          Text(subtitle,style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
        ],
      )
    ],


  );

}