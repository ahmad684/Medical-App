import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Widgets/AppBar.dart';
import 'package:oladoc/Widgets/DoctorProfileWidegt.dart';

import '../../Globels.dart';
import '../Find/ViewProfile.dart';
var type='';
class HospitalDetails extends StatefulWidget {
  String? hospitalName;
  String? location;
  String? imageUrl;
  num? contact;

  List<dynamic>? services;
  List<dynamic>? doctors;
  List<dynamic>? specialities;

 HospitalDetails({Key? key,this.hospitalName,this.location,this.doctors,this.contact,this.services,this.specialities,this.imageUrl}) : super(key: key);

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
@override
  void initState() {
    // TODO: implement initState
    type='';
  }
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    print(widget.services!.length);
    print(widget.specialities!.length);
    return Scaffold(
      appBar: customAppBar(
          title: widget.hospitalName
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.imageUrl!),
                          radius: 35,
                        ),
                        SizedBox(width: 8,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(widget.hospitalName!,softWrap: true,style: TextStyle(

                              fontSize: 25,
                            ),),
                            Text(widget.location!,style: TextStyle(
                                color: AppColors.gray
                            ),),

                          ],
                        )


                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width:width*0.6 ,


                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.mediumSlateBlue
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call,color: AppColors.white,),
                                SizedBox(width: 10,),
                                Text('Call HelpLine',style: TextStyle(color: AppColors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: width*0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.customgray
                              ),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Icon(Icons.location_on_outlined),
                          ),
                        )

                      ],
                    ),



                  ],
                ),
              ),
            ),
            SizedBox(height: 9,),
            Container(
              color: AppColors.white,
              child: ListView(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Find Doctor by Speciality',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: widget.specialities!.length,
                    itemBuilder: (context, index) {
                      return  GestureDetector(
                        onTap: (){
                          setState(() {

                            type=widget.specialities![index];
                          });
                        },
                        child: Column(children: [
                          CircleAvatar(
                            radius: 35,
                          ),
                          SizedBox(height: heigth*0.02,),
                          Text(widget.specialities![index],style: TextStyle(
                              fontSize: 12
                          ),)
                        ],),
                      );


                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,

                        childAspectRatio: 1
                    ),
                  ),
                ],
              ),
            ),
            //Doctors

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8,bottom: 0),
                  child: Container(
                      color: AppColors.white,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Doctors',style: TextStyle(fontSize: 22),),
                      )),
                ),
                ListView.builder(

                    itemCount:type==''? widget.doctors?.length:1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics()
                    ,itemBuilder: (context,index){

                  return  ProfileCard(querySnapshot: type==''?firestore.collection('Doctors').where('id',isEqualTo: widget.doctors![index]['doctorId']).snapshots():firestore.collection('Doctors').where('type',isEqualTo: type).snapshots(),);
                }),
              ],
            ),
            //Facilities

            Container(
              width: width,

              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Facilities at '+widget.hospitalName.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(
                    fontSize: 22,
                ),),
              ),
            ),

            Container(
              color: AppColors.white,
              child: ListView(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: widget.services!.length,
                    itemBuilder: (context, index) {
                      return  MyListItem(title: widget.services![index]);


                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        childAspectRatio: 5
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            //Locations&Contact

            Container(
              width: width,

              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Contacts & Location',overflow: TextOverflow.ellipsis,style: TextStyle(
                    fontSize: 22,
                ),),
              ),
            ),

            Container(
              color: AppColors.white,
              child: Column(


                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(

                     children: [
                       Icon(Icons.location_on_outlined),
                       SizedBox(width: 10,),
                       Text('Behria Town Lahore',style: TextStyle(fontSize: 15),)
                     ],
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 8,bottom: 8),
                    child: Divider(

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        Icon(Icons.watch_later_outlined),
                        SizedBox(width: 10,),
                        Text('24/7 Emergency Service',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 8,bottom: 8),
                    child: Divider(

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 10,),
                        Text('03094456789',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),

                ],
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar:  Container(
        color: AppColors.white,
        child: Padding(
            padding:  EdgeInsets.all(width*0.04),
            child: Container(


              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.mediumSlateBlue
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call,color: AppColors.white,),
                  SizedBox(width: 10,),
                  Text('Call HelpLine',style: TextStyle(color: AppColors.white,fontSize: 20),),
                ],
              ),
            )
        ),
      ),

    );
  }
}
