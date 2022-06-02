import 'package:flutter/material.dart';

import '../../Constants/Colors.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Medical Records',style: TextStyle(color: AppColors.black,fontSize: 16),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 50,),
            CircleAvatar(
                backgroundColor: AppColors.customgray,
                radius: 50,
                child: Icon(Icons.receipt_long_rounded,size: 50,color: AppColors.black,)),
            SizedBox(height: 20,),
            Text('All your medical records in one place'),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.done,color: AppColors.orangeDark,),
                SizedBox(width: 10,),
                Text('Never lose your medical records'),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.done,color: AppColors.orangeDark,),
                SizedBox(width: 10,),
                Text('Access prescriptions,reports and\n more on the go'),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.done,color: AppColors.orangeDark,),
                SizedBox(width: 10,),
                Text('Share your medical records with\n doctor'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
