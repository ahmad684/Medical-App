import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Widgets/DoctorProfileWidegt.dart';

import '../../Constants/Colors.dart';
import '../../Globels.dart';
import '../../Widgets/AppBar.dart';
import '../../Widgets/TextField.dart';
import 'ViewProfile.dart';
class SpecialistySearch extends StatefulWidget {
  String? specialityName;
   SpecialistySearch({Key? key,this.specialityName}) : super(key: key);

  @override
  State<SpecialistySearch> createState() => _SpecialistySearchState();
}

class _SpecialistySearchState extends State<SpecialistySearch> {
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppBar(
            title: widget.specialityName.toString()+' in karachi'
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(heigth*0.01),
                  child: SearchTextField(),
                ),
              ),
              Container(
            color: AppColors.white,
            width: double.infinity,
            height: 150,
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.location_on,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Doctor Near\nMe',style: TextStyle(
                                    color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.feedback_rounded,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Lowest Fee',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.work_outline_outlined,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Most\nExperience',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.date_range,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Available\nToday',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.female_sharp,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Female\nDoctors',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.thumb_up_alt_outlined,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Highest\nRated',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.star,color: Colors.amber,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Platinium\nDoctors',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(heigth*0.01),
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: Container(
                            height: 55,
                            width: width*0.5,



                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: heigth,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.vodka,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )
                                  ),

                                  child: Icon(Icons.contact_phone_sharp,color: AppColors.mediumSlateBlue,),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: heigth*0.01,right: heigth*0.02),
                                  child: Text('Vedio\nConsultaion',style: TextStyle(
                                      color: AppColors.mediumSlateBlue,fontSize: 17
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),




                ],
              ),
            )
          ),
              Padding(
              padding: EdgeInsets.fromLTRB(heigth*0.01,heigth*0.02,heigth*0.01,heigth*0.02),
              child: Text('Top 110 Skin Specilalist inkarachi',style: TextStyle(
                fontSize: 15,color: AppColors.mediumSlateBlue
              ),),
            ),
              Container(

                width: width,
                decoration: BoxDecoration(
                  color: AppColors.mediumSlateBlue
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(heigth*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('oladoc Care-Book Doctor for Rs.\n500',style: TextStyle(color: AppColors.white),),
                          Text('View All',style: TextStyle(color: AppColors.white,decoration: TextDecoration.underline),),

                        ],
                      ),
                    ),
                    Container
                      (
                      height: 200,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: firestore.collection('Doctors').where('type',isEqualTo: widget.specialityName.toString()).snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot){
                          if(snapshot.hasData){
                            return  ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal
                                ,itemBuilder: (context, index){
                                  DocumentSnapshot ds=snapshot.data!.docs[index];
                              return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(4)
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 5,),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(ds['doctorProfileUrl']),
                                          radius: 30,
                                        ),
                                        SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            Icon(Icons.thumb_up_alt_sharp,size: 15,) ,
                                            Text(ds['satisfied'].toString()+"%")
                                          ],
                                        ),
                                        Text(ds['doctorName'],style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold
                                        ),),
                                        Text(ds['experience'].toString()+'Years Experience',style: TextStyle(
                                            color: AppColors.gray
                                        ),),
                                        Text("Rs."+ds['fee'].toString(),style: TextStyle(
                                            color: AppColors.gray
                                        )),
                                        SizedBox(height: 4,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: AppColors.mediumSlateBlue,
                                                  width: 1

                                              )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text('Book Appointment',style: TextStyle(color: AppColors.mediumSlateBlue),),
                                          ),
                                        )
                                      ],
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


                      ),

                    )

                  ],
                ),
              ),
              ProfileCard(querySnapshot: firestore.collection('Doctors').where('type',isEqualTo: widget.specialityName.toString()).snapshots(),)





            ],
          ),
        )
    );
  }
}
