import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oladoc/Screens/Appointments/BookAppointment.dart';

import '../Constants/Colors.dart';
import '../Globels.dart';
import '../Screens/Find/ViewProfile.dart';
var doctorName;
class ProfileCard extends StatelessWidget {
  Stream<QuerySnapshot>? querySnapshot;
ProfileCard({Key? key,this.querySnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return   StreamBuilder<QuerySnapshot>(
      stream: querySnapshot,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          return  ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemBuilder: (context, index){
                DocumentSnapshot ds=snapshot.data!.docs[index];
                return  GestureDetector(
                  onTap: (){
                    Get.to(()=>DoctorProfile(id: ds['id'],name: ds['doctorName'],));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      width: width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.customgray,width: 1),
                          borderRadius: BorderRadius.circular(5)
                      ),

                      child: (
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(ds['doctorProfileUrl']),
                                      radius: 30,
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(ds['doctorName'],style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 18
                                        ),),
                                        SizedBox(height: 5,),
                                        Text(ds['specialities'],
                                          style: TextStyle(color: AppColors.gray),
                                          overflow: TextOverflow.clip,

                                          softWrap: true,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: ds['experience'].toString()+" Years\n",
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: AppColors.black)),
                                          TextSpan(
                                              text: "Experience",
                                              style: TextStyle(
                                                color:AppColors.gray,
                                              )),
                                        ]),
                                      ),
                                      VerticalDivider(
                                        color: AppColors.gray,
                                        thickness: 1,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: ds['waitingTime'].toString()+"  min\n",
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: AppColors.black)),
                                          TextSpan(
                                              text: "wait Time",
                                              style: TextStyle(
                                                color:AppColors.gray,
                                              )),
                                        ]),
                                      ),
                                      VerticalDivider(
                                        color: AppColors.gray,
                                        thickness: 1,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: ds['satisfied'].toString()+"%(198)\n",
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: AppColors.black)),
                                          TextSpan(
                                              text: "Satisfied",
                                              style: TextStyle(
                                                color:AppColors.gray,
                                              )),
                                        ]),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: AppColors.scaffoldBackgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ds['reviews'][0]['review']

                                      ,maxLines: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container
                                  (

                                  height: 74,
                                  child: ListView.builder(
                                      itemCount: ds['hospitals'].length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,

                                      itemBuilder: (context,i){
                                    return StreamBuilder<QuerySnapshot>(
                                      stream: firestore.collection('Hopitals').where('id',isEqualTo: ds['hospitals'][i]['hospitalID']).snapshots(),
                                      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshots){
                                        return ListView.builder(
                                            itemCount: snapshots.data!.docs.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal
                                            ,itemBuilder: (context, ind){
                                          DocumentSnapshot hs=snapshots.data!.docs[ind];
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: GestureDetector(
                                              onTap: (){



                                                Get.to(()=>SelectTimeSlot(slots: [...ds['hospitals'][index]['timing']['slots']],days: [...ds['hospitals'][index]['timing']['daysOfWeek']],doctorName:ds['doctorName'] ,address: hs['Address'],hospitalName:hs['hospitalName'],fee:ds['hospitals'][index]['fee'] ,imageUrl: ds['doctorProfileUrl'],hospitalId: ds['hospitals'][index]['hospitalID'],doctorId: ds['id'],));
                                              },
                                              child: Container(
                                                width: width*0.7,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors.customgray
                                                    ),
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: Text(hs['hospitalName'],style: TextStyle(fontSize: 18),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(ds['hospitals'][index]['timing']['isavailable'],style: TextStyle(color: Colors.green),),
                                                          SizedBox(width: 30,),
                                                          Text('Rs.'+ds['hospitals'][index]['fee'].toString()),

                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                        });

                                      },

                                    );

                                  })
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                              color: AppColors.mediumSlateBlue,
                                              width: 1

                                          )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.video_call,color: AppColors.mediumSlateBlue,),
                                            Text('Book Appointment',style: TextStyle(color: AppColors.mediumSlateBlue,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.orangeDark,
                                        borderRadius: BorderRadius.circular(2),

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontSize: 18),),
                                      ),
                                    )
                                  ],
                                ),
                              )


                            ],
                          )
                      ),
                    ),
                  ),
                );

              });
        }

        else{
          return Text('Loading.....');
        }

      },


    );
  }
}

