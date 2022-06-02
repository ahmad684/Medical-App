import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Screens/Appointments/AppointmentDetails.dart';
import 'package:oladoc/Screens/Appointments/BookAppointment.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',style: TextStyle(color: AppColors.black,fontSize: 16),),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Appointments').where('patientId',isEqualTo: auth.currentUser!.uid).snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
        return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.calendar_today_outlined,size: 100,),


              SizedBox(height: 20,),

              Text('You have no upcoming Appointment')],
          ),
        );


        }else{
         return ListView.builder(

             itemCount: snapshot.data!.docs.length,
             itemBuilder: (context,index){
               DocumentSnapshot ds=snapshot.data!.docs[index];
               return Container(

                 color: AppColors.white,
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Padding(
                       padding: const EdgeInsets.fromLTRB(8.0,20,8,8),
                       child: Container(
                         height:70 ,
                         width: width*0.2,

                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                           color: Color(0xFFECECF3),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('02\nJun',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                         ),
                       ),
                     ),
                     SizedBox(width: 16,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 22,),
                         Text(ds['doctorName'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                         SizedBox(height: 5,),

                         Text(ds['date'],style: TextStyle(color: AppColors.gray,fontSize: 16),),
                         SizedBox(height: 5,),
                         Text(ds['hospitalName']+" "+ds['address'],style: TextStyle(color: AppColors.gray,fontSize: 16),),
                         SizedBox(height: 5,),
                         Text("Patient Name:"+ds['patientName'],style: TextStyle(color: AppColors.gray,fontSize: 16),),
                         SizedBox(height: 10,),
                         Text("Fee :"+ds['fee'],style: TextStyle(color: AppColors.gray,fontSize: 16),),

                         Divider(thickness: 2,color: AppColors.customgray,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             GestureDetector(
                               onTap: (){
                                 //Get.to(()=>SelectTimeSlot(doctorName: ds['doctorName'],fee: int.parse(ds['fee']),hospitalName: ds['hospitalName'],address: ds['address'],hospitalId: ds['hospitalId'],doctorId: ds['doctorId'],imageUrl: ds['profileUrl'],));

                               },
                               child: Container(
                                 height: 50,
                                 width: width*0.37,
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
                                   child: Center(child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold),)),
                                 ),
                               ),
                             ),
                             SizedBox(width: 10,),
                             GestureDetector(
                               onTap: (){
                                 Get.to(()=>AppointmentDetails());
                               },
                               child: Container(
                                 width: width*0.3,
                                 height: 50,


                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(2),
                                     border: Border.all(
                                         color: AppColors.mediumSlateBlue,
                                         width: 1

                                     )
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(6.0),
                                   child: Center(child: Text('More Options',style: TextStyle(color: AppColors.mediumSlateBlue,fontWeight: FontWeight.bold),)),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 18,),

                       ],
                     )



                   ],),
               );


             });

        }

      }),
    );
  }
}
//