import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/Widgets/AppBar.dart';

import '../../Constants/Colors.dart';
import 'AppointmentConfirmation.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(
        title: 'Appointment Details'
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(radius: 20,
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr.Ali Raza',style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                      SizedBox(height: 5,),
                      Text('B.D.S',
                        style: TextStyle(color: AppColors.gray),
                        overflow: TextOverflow.clip,

                        softWrap: true,),
                      Text('Dentist',
                        style: TextStyle(color: AppColors.black),
                        overflow: TextOverflow.clip,

                        softWrap: true,),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Padding(
                padding:  EdgeInsets.all(width*0.04),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x59B8B2DE,)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [

                            SizedBox(width: 10,),
                            Text('Payment Details',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Container(

                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
                                  color: AppColors.orangeDark,),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Rs.800 Pending',style: TextStyle(color: AppColors.white),),
                                )),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child:  CircleAvatar
                          (
                            backgroundColor: AppColors.vodka,
                            radius: 9,
                            child: Icon(Icons.keyboard_arrow_down,size: 15,color: AppColors.black,)),
                      ),




                    ],),
                )
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
                padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                child: CustomRow(Icon(Icons.person), 'Patient Name', 'Ahmad Raza')
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
                padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
                child: CustomRow(Icon(Icons.calendar_today_outlined), 'Appointment Time', DateTime.now().toString())
            ),
            SizedBox(
              height: 14,
            ),

            Padding(
                padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: 0.01,top: 0.02),
                child: CustomRow(Icon(Icons.medical_services_outlined), 'Location', 'Al-Ghani Dental'+" at "+'Medical Center')
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.17,right: width*0.05,bottom: 0,top: 4),
              child: Text('Loahore',style: TextStyle(
                color: AppColors.customgray,
              ),
                textAlign: TextAlign.start,),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: 0.01,top: 0.02),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(

                        width: 1,color: AppColors.black
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.location_on_outlined,color: Colors.red,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('See on Map')
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.05,right: width*0.05,bottom: width*0.04,top: 0.02),
              child: Divider(
                thickness: 1,
                color: AppColors.scaffoldBackgroundColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    //Get.to(()=>SelectTimeSlot(doctorName: ds['doctorName'],fee: int.parse(ds['fee']),hospitalName: ds['hospitalName'],address: ds['address'],hospitalId: ds['hospitalId'],doctorId: ds['doctorId'],imageUrl: ds['profileUrl'],));

                  },
                  child: Container(
                    height: 40,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        color: AppColors.mediumSlateBlue,

                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                            color: AppColors.mediumSlateBlue,
                            width: 1

                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(child: Text('Add Medical Records',style: TextStyle(color: AppColors.white,),)),
                    ),
                  ),
                ),  GestureDetector(
                  onTap: (){
                    //Get.to(()=>SelectTimeSlot(doctorName: ds['doctorName'],fee: int.parse(ds['fee']),hospitalName: ds['hospitalName'],address: ds['address'],hospitalId: ds['hospitalId'],doctorId: ds['doctorId'],imageUrl: ds['profileUrl'],));

                  },
                  child: Container(
                    height: 40,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        color: AppColors.mediumSlateBlue,

                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                            color: AppColors.mediumSlateBlue,
                            width: 1

                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: Text('View Medical Records',style: TextStyle(color: AppColors.white),)),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              //Get.to(()=>AppointmentDetails());
            },
            child: Container(
              width: width*0.45,
              height: 40,


              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      color: AppColors.mediumSlateBlue,
                      width: 1

                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(child: Text('Reschedual',style: TextStyle(color: AppColors.mediumSlateBlue,),)),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              //Get.to(()=>AppointmentDetails());
            },
            child: Container(
              width: width*0.45,
              height: 40,


              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      color: Colors.red,
                      width: 1

                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(child: Text('Cancel',style: TextStyle(color: Colors.red,),)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
