import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Drawer/MyDrawer.dart';
import 'package:oladoc/Globels.dart';


import 'package:oladoc/Screens/Auth/PhoneLogin.dart';
import 'package:oladoc/Screens/Find/SpecialitySearch.dart';
import 'package:oladoc/Widgets/AppBar.dart';
import 'package:oladoc/Widgets/Card.dart';
import 'package:oladoc/Widgets/TextField.dart';

import 'Appointments/Appointments.dart';
import 'Find/FindDoctor.dart';
import 'Hospital/HospitalDetails.dart';
import 'Location/SelectLocation.dart';
import 'MedicalRecord/MedicalRecords.dart';
class MainScreen extends StatefulWidget {

  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();


String name='unknown';
  Future getDocs() async {
    QuerySnapshot querySnapshot =
    await firestore.collection("Users").get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      var snapshot = await firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .get();

setState(() {
  name=snapshot.data()!['UserName'];
});

    }
  }
@override
  void initState() {
    auth.currentUser!=null?getDocs():'';
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
       body: TabBarView(
         physics: NeverScrollableScrollPhysics(),

         children: [
           Scaffold(
             key: scaffolKey,
             appBar: AppBar(
               elevation: 1,
               leading: FirebaseAuth.instance.currentUser==null?GestureDetector(
                   onTap: (){
                     Get.to (()=>MobileLogin());
                   },
                   child: Padding(
                     padding:  EdgeInsets.only(left: width*0.02,top: heigth*0.03),
                     child: Text('Sign In',style: TextStyle(color: AppColors.kTextColor,fontSize: 14),),
                   )):GestureDetector(
                   onTap: (){

                    scaffolKey.currentState!.openDrawer();
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       
                       decoration: BoxDecoration(
                         color: AppColors.mediumSlateBlue,
                         borderRadius: BorderRadius.circular(20)
                       ),
                       height: 10,
                         width: 10,
                         child: Center(child: Text(name.characters.first.toUpperCase(),style: TextStyle(backgroundColor: AppColors.mediumSlateBlue,fontSize: 22),))),
                   )),
               title: RichText(
                 textAlign: TextAlign.center,
                 text: TextSpan(children: <TextSpan>[
                   TextSpan(
                       text: "ola",
                       style: TextStyle(color: Color(0xFFEC5712),fontWeight: FontWeight.bold,fontSize: 20)),
                   TextSpan(
                       text: "doc",
                       style: TextStyle(
                           color:AppColors.mediumSlateBlue,
                           fontWeight: FontWeight.bold,fontSize: 20)),
                 ]),
               ),
               centerTitle: true,
               actions: [

                 GestureDetector(
                   onTap: (){
                     Get.to(()=>SelectLocaton());
                   },
                   child: Row(children: [
                     Text('Lahore',style: TextStyle(color: AppColors.kTextColor,fontWeight: FontWeight.bold),),
                     Icon(Icons.arrow_drop_down,color: AppColors.black,)
                   ],),
                 )
               ],
             ),
             drawer: Container(
               width: width*0.7,
                 child: MyDrawer(name,1)),



             body: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding:  EdgeInsets.all(width*0.04),
                     child: customCard(
                         Padding(
                           padding:  EdgeInsets.all(width*0.03),
                           child: Text('I want to book',style: TextStyle(
                               fontSize: 18
                           ),),
                         ),
                         Padding(
                           padding:  EdgeInsets.all(width*0.04),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               GestureDetector(
                                 onTap: (){
                                   Get.to(()=>FindDoctor());
                                 },
                                 child: Container(
                                   width: width*0.45,
                                   height: 200,
                                   decoration: BoxDecoration(
                                       color: AppColors.orangeligth,
                                       borderRadius: BorderRadius.circular(10)

                                   ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                     Padding(
                                       padding:  EdgeInsets.all(heigth*0.01),
                                       child: Text(
                                           'Doctor\nAppointment'
                                       ),
                                     ),
                                     Image(
                                         height: 140,
                                         width: 100,
                                         image: AssetImage('assets/images/appointmentPic.png'))
                                   ],),

                                 ),
                               ),
                               GestureDetector(
                                 onTap: (){
                                   Get.to(()=>FindDoctor());
                                 },
                                 child: Container(
                                   width: width*0.35,
                                   height: 200,
                                   decoration: BoxDecoration(
                                       color: AppColors.vodka,
                                       borderRadius: BorderRadius.circular(10)

                                   ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(
                                           'Doctor\nAppointment'
                                       ),
                                     ),
                                     Image(
                                         height: 140,
                                         width: 100,
                                         image: AssetImage('assets/images/teleConsultation.png'))
                                   ],),

                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                             padding:  EdgeInsets.all(width*0.04),
                             child: Container(
                               height: 70,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: AppColors.scaffoldBackgroundColor
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Align(
                                     alignment: Alignment.bottomLeft,
                                     child: Image(
                                       height: 50,
                                       width: 50,
                                       image: AssetImage('assets/images/lab.png'),

                                     ),
                                   ),
                                   Text('Lab Tes'),
                                   Container(
                                     decoration: BoxDecoration(
                                         color: AppColors.vodka,
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.discord_rounded),
                                         Text('20 % off'),
                                       ],
                                     ),
                                   ),
                                   SizedBox(
                                     width: width*0.00001,
                                   )

                                 ],),
                             )
                         )),
                   ),
                   Padding(
                     padding:  EdgeInsets.all(width*0.04),
                     child: customCard(
                         Padding(
                           padding:  EdgeInsets.all(width*0.03),
                           child: Text('Search for Doctors',style: TextStyle(
                               fontSize: 18
                           ),),
                         ),
                         Padding(
                           padding:  EdgeInsets.all(width*0.04),
                           child: SearchTextField(),
                         ),
                         Padding(
                             padding:  EdgeInsets.all(width*0.04),
                             child: Container(
                               height: heigth*0.1,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: AppColors.scaffoldBackgroundColor
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Align(
                                     alignment: Alignment.bottomLeft,
                                     child: Image(
                                       height: 50,
                                       width: 50,
                                       image: AssetImage('assets/images/lab.png'),

                                     ),
                                   ),
                                   Text('Lab Tes'),
                                   Container(
                                     decoration: BoxDecoration(
                                         color: AppColors.vodka,
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.discord_rounded),
                                         Text('20 % off'),
                                       ],
                                     ),
                                   ),
                                   SizedBox(
                                     width: width*0.00001,
                                   )

                                 ],),
                             )
                         )),
                   ),
                   Padding(
                     padding:  EdgeInsets.all(width*0.04),
                     child: customCard(

                         Padding(
                           padding:  EdgeInsets.all(width*0.03),
                           child: Text('I am Looking for',style: TextStyle(
                               fontSize: 18
                           ),),
                         ),
                         Container(
                           height: 120,
                           child: Padding(
                             padding:  EdgeInsets.all(width*0.04),
                             child:   StreamBuilder<QuerySnapshot>(
                               stream: firestore.collection('Specialities').snapshots(),
                               builder: (BuildContext context,
                                   AsyncSnapshot<QuerySnapshot> snapshot){
                                 if(snapshot.hasData){
                                   return ListView.builder(
                                       shrinkWrap: true,
                                       scrollDirection: Axis.horizontal,
                                       itemCount: snapshot.data!.docs.length,
                                       itemBuilder: (context,index){
                                         DocumentSnapshot ds = snapshot.data!.docs[index];
                                         return Padding(
                                           padding: const EdgeInsets.all(4.0),
                                           child: GestureDetector(
                                             onTap: (){
                                               Get.to(()=>SpecialistySearch());

                                             },
                                             child: Column(children: [
                                               CircleAvatar(
                                                 radius: 25,
                                                 backgroundImage: NetworkImage(ds['image']),
                                               ),
                                               SizedBox(height: heigth*0.02,),
                                               Expanded(
                                                 child: Text(ds['name'],style: TextStyle(
                                                     fontSize: 12
                                                 ),),
                                               )
                                             ],),
                                           ),
                                         );

                                       });
                                 }

                                 else{
                                   return Text('Loading.....');
                                 }

                               },


                             )
                           ),
                         ),
                         Padding(
                             padding:  EdgeInsets.all(width*0.04),
                             child: Container(
                               height: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: AppColors.scaffoldBackgroundColor
                               ),
                               child: Center(child: Text('All Specialization')),
                             )
                         )),
                   ),
                   Padding(
                     padding:  EdgeInsets.all(width*0.04),
                     child: customCard(
                         Padding(
                           padding:  EdgeInsets.all(width*0.03),
                           child: Row(
                             children: [
                               Icon(Icons.add_moderator,color: Colors.green,),
                               SizedBox(width: width*0.02),

                               Text('Have Corporate Insurance?',style: TextStyle(
                                   fontSize: 18
                               ),),
                             ],
                           ),
                         ),
                         Padding(
                           padding:  EdgeInsets.fromLTRB(width*0.07,width*0.03,0,width*0.02),
                           child: Row(
                             children: [
                               Icon(Icons.circle,size: 5,color: AppColors.gray,),
                               SizedBox(width: width*0.04,),
                               Text('Free Unlimited vedio Consultation',style: TextStyle(color: AppColors.gray),),
                             ],
                           ),
                         ),
                         Padding(
                             padding:  EdgeInsets.all(width*0.04),
                             child: Container(

                               height: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: AppColors.orangeDark
                               ),
                               child: Center(child: Text('Connect Now',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                             )
                         )),
                   ),
                   Padding(
                       padding:  EdgeInsets.all(width*0.04),
                       child: customCard(
                           Padding(
                             padding:  EdgeInsets.all(width*0.03),
                             child: Text('Popular Hospitals',style: TextStyle(
                                 fontSize: 18
                             ),),
                           ),
                           Container(
                             height: 200,
                             child: Padding(
                               padding:  EdgeInsets.all(width*0.04),
                               child:  StreamBuilder<QuerySnapshot>(
                                 stream: firestore.collection('Hopitals').snapshots(),
                                 builder: (BuildContext context,
                                     AsyncSnapshot<QuerySnapshot> snapshot){
                                   if(snapshot.hasData){
                                     return ListView.builder(
                                         shrinkWrap: true,
                                         scrollDirection: Axis.horizontal,
                                         itemCount: snapshot.data!.docs.length,
                                         itemBuilder: (context,index){
                                           DocumentSnapshot ds = snapshot.data!.docs[index];
                                           return Padding(
                                             padding: const EdgeInsets.all(4.0),
                                             child: Container(
                                               height: 150,
                                               width: 190,
                                               child: ClipRRect(

                                                 borderRadius: BorderRadius.circular(10),
                                                 child: GridTile(
                                                   child: GestureDetector(
                                                     onTap: () {
                                                       Get.to(()=>HospitalDetails(hospitalName: ds['hospitalName'],location: ds['Address'],contact: ds['Contact'],services: [...ds['Services']],specialities: [...ds['specialities']],imageUrl: ds['hospitalImageUrl'],doctors: [...ds['Doctors']],));


                                                     },
                                                     child: Image.network(
                                                       ds['hospitalImageUrl'],

                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                   footer: GridTileBar(
                                                     backgroundColor: AppColors.scaffoldBackgroundColor,

                                                     title: Text(
                                                       ds['hospitalName'],style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),
                                                       textAlign: TextAlign.center,
                                                     ),

                                                   ),
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
                             ),
                           ),
                           Container())
                   ),

                   SizedBox(height: 20,),





                 ],
               ),
             ),



             floatingActionButton: FloatingActionButton(

               child: Icon(Icons.call,color: AppColors.white,),
               backgroundColor: AppColors.orangeDark,

               onPressed: (){

               },
             ),
           ),

           MyAppointments(),
           MedicalRecord()
         ],
       ),
        bottomNavigationBar:Container(
          color: AppColors.white,
          height: 60,
          child: TabBar(


              labelColor: AppColors.mediumSlateBlue,
              unselectedLabelColor: AppColors.customgray,
              indicatorColor: AppColors.transparent,
              labelPadding: EdgeInsets.all(2),






              tabs: [
                Tab(

                  icon:Icon(Icons.home,),
                  child: Text('Home',style: TextStyle(),

                  )



                  ,
                ) ,
                Tab(
                  icon:Icon(Icons.calendar_today_outlined,),
                  child: Text('Appointment'

                  )



                  ,
                ) ,
                Tab(
                  icon:Icon(Icons.medical_services_outlined),
                  child: Text('Medical Records'

                  )



                  ,
                ) ,
              ]
          ),
        ),
        )
    );
  }
}


