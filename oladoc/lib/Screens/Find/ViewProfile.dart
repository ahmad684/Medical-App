import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Widgets/AppBar.dart';

import '../../Constants/Colors.dart';

class DoctorProfile extends StatelessWidget {
  String? id;
  String? name;
   DoctorProfile({Key? key,this.id,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: name
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Doctors').where('id',isEqualTo:id ).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return  ListView.builder(

                itemCount: 1,


                itemBuilder: (context, index){
                  DocumentSnapshot ds=snapshot.data!.docs[index];
                  return
                  Column(
                    children: [
                      SizedBox(
                        height: heigth*0.01,
                      ),
                      Container(



                      decoration: BoxDecoration(
                      color: AppColors.white,

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
                      text: ds['waitingTime'].toString()+" min\n",
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
                      text: ds["satisfied"].toString()+"%(198)\n",
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
                        SizedBox(height: 15,)


                      ],
                      )
                      ),
                      ),
                      SizedBox(height: heigth*0.01,),
                      Container(
                        width: width,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Book Appointment',style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        width: width,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jinnah Hospital',style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(

                                  children: [
                                    TextSpan(text: 'Fee :',style: TextStyle(color: AppColors.gray)),
                                    TextSpan(text: 'Rs.2000',style: TextStyle(color: AppColors.black)),
                                  ]
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Available Tomorrow',style: TextStyle(color: Colors.green),),
                                  Text('3:00PM-6:00PM',style: TextStyle(color: Colors.black),)
                                ],
                              ),
                              Padding(
                                  padding:  EdgeInsets.all(width*0.04),
                                  child: Container(

                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: AppColors.orangeDark
                                    ),
                                    child: Center(child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        width: width,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.video_call,color: AppColors.mediumSlateBlue,),
                                  Text('Online Video Consultation',style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(

                                    children: [
                                      TextSpan(text: 'Fee :',style: TextStyle(color: AppColors.gray)),
                                      TextSpan(text: 'Rs.2000',style: TextStyle(color: AppColors.black)),
                                    ]
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Available Tomorrow',style: TextStyle(color: Colors.green),),
                                  Text('3:00PM-6:00PM',style: TextStyle(color: Colors.black),)
                                ],
                              ),
                              Padding(
                                  padding:  EdgeInsets.all(width*0.04),
                                  child: Container(

                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: AppColors.mediumSlateBlue
                                    ),
                                    child: Center(child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star),

                                  Expanded(
                                    child: Text('Reviews of Dr.Tania Shaikh ',style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),softWrap: true,overflow: TextOverflow.clip,),
                                  ),
                                  Text('(439)',style: TextStyle(
                                      fontSize: 18,color: AppColors.gray
                                  ),),


                                ],
                              ),

                              SizedBox(height: 10,),
                              Divider(thickness: 0.5,height: 0.01,),

                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(

                                    width: width*0.35,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(radius: 30,
                                          backgroundColor: AppColors.black,
                                          child: Center(child: Text('98%',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text('Satisfied out of 349 Patients'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: width*0.65,


                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,top: 4,bottom: 2),
                                          child: Text('Doctor Checkup',style: TextStyle(color: AppColors.customgray),),
                                        ),
                                        GFProgressBar(
                                          percentage: 0.9,
                                          width: width*0.4,
                                          backgroundColor: AppColors.customgray,
                                          progressBarColor: AppColors.black,
                                          trailing: Text('90%'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,top: 4,bottom: 2),
                                          child: Text('Doctor Checkup',style: TextStyle(color: AppColors.customgray),),
                                        ),
                                        GFProgressBar(
                                          percentage: 0.9,
                                          width: width*0.4,
                                          backgroundColor: AppColors.customgray,
                                          progressBarColor: AppColors.black,
                                          trailing: Text('90%'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,top: 4,bottom: 2),
                                          child: Text('Doctor Checkup',style: TextStyle(color: AppColors.customgray),),
                                        ),
                                        GFProgressBar(
                                          percentage: 0.9,
                                          width: width*0.4,
                                          backgroundColor: AppColors.customgray,
                                          progressBarColor: AppColors.black,
                                          trailing: Text('90%'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Clinic Locations of Dr.Tania Shaikh',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      ListView.builder(
                        shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                        itemBuilder: (context,index){
                        return Column(
                          children: [
                            Container(
                              width: width,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Azzure Hospital',style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                    SizedBox(height: 10,),
                                    Text('Gulstan Johr Karachi',style: TextStyle(color: AppColors.customgray)),
                                    SizedBox(height: 10,),
                                    Row(children: [
                                      Icon(Icons.location_on_outlined,size: 18,),
                                      Text('View on map',style: TextStyle(
                                          fontSize: 18,
                                          decoration: TextDecoration.underline
                                      ),),
                                      Icon(Icons.arrow_forward_ios,size: 18,),
                                    ],),
                                    SizedBox(height: 10,),
                                    RichText(
                                      text: TextSpan(

                                          children: [
                                            TextSpan(text: 'Fee :',style: TextStyle(color: AppColors.gray)),
                                            TextSpan(text: 'Rs.2000',style: TextStyle(color: AppColors.black)),
                                          ]
                                      ),
                                    ),
                                    SizedBox(height: 10,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tomorrow',style: TextStyle(color: Colors.black),),
                                        Text('3:00PM-6:00PM',style: TextStyle(color: Colors.black),)
                                      ],
                                    ),
                                    Padding(
                                        padding:  EdgeInsets.all(width*0.04),
                                        child: Container(

                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              color: AppColors.orangeDark
                                          ),
                                          child: Center(child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(thickness: 0.5,height: 0.01,),
                          ],
                        );

                        },
                      ),
                      SizedBox(height: 10,),
                      //Services
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Services',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return  MyListItem(title: 'First Item');


                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,

                                  childAspectRatio: 4
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      //Conditions Treated
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Conditions Treated',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return  MyListItem(title: 'First Item');


                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,

                                  childAspectRatio: 4
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      //Education
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Education',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return  MyListItem(title: 'First Item');


                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,

                                  childAspectRatio: 4
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      //Specialization
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Specialization',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return  MyListItem(title: 'First Item');


                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,

                                  childAspectRatio: 5
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      //Professional Membership
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Professional MemberShip',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return  MyListItem(title: 'First Item');


                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,

                                  childAspectRatio: 5
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      //About Doctor
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Professional MemberShip',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Fueled by an accusatory post posted in a local FB group, physicians recently came to the defense of their unsuspecting colleague, who was unaware of vitriol that had been shared. These first-hand stories aim to raise awareness from the physician’s angle, and remind everyone out there that doctors are humans, too.'),
                        )
                      ),
                      SizedBox(height: 10,),

                      //Reviews
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Reviews About Dr.Tania Shaikh',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Divider(thickness: 0.5,height: 0.01,),
                      Container(
                        color: AppColors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(width: 1,color: AppColors.customgray),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.thumb_up_off_alt,size: 15,),
                                        SizedBox(width: 5,),
                                        Text('Satisfied',style: TextStyle(fontSize: 16),)
                                      ],),
                                      SizedBox(height: 8,),
                                      Text('"your are the best doctor in karachi by my experience"'),
                                      SizedBox(height: 8,),
                                      Text('Verified Patient. 1 month ago',style: TextStyle(color: AppColors.customgray),),

                                    ],
                                  ),
                                ),
                              ),
                            );


                          },

                        ),
                      ),
                      SizedBox(height: 10,),
                      //Similar Doctors
                      Container(
                        width: width,

                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Similar Doctors',overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),

                      Container
                        (
                        color: AppColors.white,
                        height: 140,
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal
                            ,itemBuilder: (context, index){
                          return  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              color: AppColors.white,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        CircleAvatar(
                                          radius: 30,
                                        ),
                                        SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            Icon(Icons.thumb_up_alt_sharp,size: 15,) ,
                                            Text('98%')
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      children: [
                                        SizedBox(height: 4,),
                                        Text('Dr.Tania Shaik',style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold
                                        ),),
                                        Text('11 years Experience',style: TextStyle(
                                            color: AppColors.gray
                                        ),),
                                        Text('Rs.500',style: TextStyle(
                                            color: AppColors.gray
                                        )),
                                        SizedBox(height: 8,),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.orangeDark,
                                              borderRadius: BorderRadius.circular(2),

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text('Book Appointment',style: TextStyle(color: AppColors.white,fontSize: 18),),
                                          ),
                                        )
                                      ],
                                    )


                                  ],
                                ),
                              ),
                            ),
                          );

                        }),
                      ),
                      SizedBox(height: 10,),









                    ],
                  );

                });
          }

          else{
            return Text('Loading.....');
          }

        },


      )

     ,
      bottomNavigationBar:  Container(
        color: AppColors.white,
        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: width*0.4,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  color: AppColors.mediumSlateBlue

                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call,color: AppColors.white,),
                      Text('Call',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 20),),
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
        ),
      ),
    );
  }
}
class MyListItem extends StatelessWidget {
  final String? title;

  MyListItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.circle,size: 5,),
          SizedBox(width: 10,),
          Text(title!),
        ],
      ),
    );
  }
}