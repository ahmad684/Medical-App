import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';

import 'package:oladoc/Widgets/AppBar.dart';
import 'package:oladoc/Widgets/TextField.dart';

import '../../Globels.dart';
import 'SpecialitySearch.dart';
class FindDoctor extends StatelessWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: 'Find Doctor'
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
            Padding(
              padding: EdgeInsets.all(heigth*0.01),
              child: Text('Search by speciality',style: TextStyle(fontSize: 18),),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('Specialities').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData){
                  return ListView(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),

                        itemCount:snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          return Padding(
                            padding: EdgeInsets.all(heigth*0.01),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(()=>SpecialistySearch(specialityName: ds['name'],));

                              },
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(5)
                                ),

                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(ds['image']),

                                      ),
                                    ),

                                    Expanded(child: Text(ds['name']))
                                  ],
                                ),
                              ),
                            ),
                          );

                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,

                            childAspectRatio: 3
                        ),
                      ),
                    ],
                  );
                }

                else{
                  return Text('Loading.....');
                }

              },


            )

          ],
        ),
      )
    );
  }
}
