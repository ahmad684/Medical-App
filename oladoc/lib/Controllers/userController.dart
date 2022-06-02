import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Models/User.dart';

class UserData extends GetxController{
  UserDataModel userDataModel=UserDataModel();
  UserDataModel get userData{
    return userDataModel;
  }
  Future<void> setUserData({
    @required String? userName,
    @required String? userId,
    @required String? email,
    @required String? gender,
    @required String? phoneNumbe,
    @required int? age,

  })async{
    try{
      await _setUserCredentials(
          userName: userName, userId: auth.currentUser!.uid, email: email, phoneNumber:phoneNumbe,gender: gender ,age: age);



    }catch(e){

    }

  }

  Future<void> _setUserCredentials({
    @required String? userName,
    @required String? userId,
    @required String? email,
    @required String? gender,
    @required String? phoneNumber,
    @required int? age



  })async{
    final Timestamp timestamp=Timestamp.now();
    firestore.collection('Users').doc(userId).set({
      'UserName':userName,
      'UserId':userId,
      'email':email,
      'phoneNumber':phoneNumber,
      'gender':gender,
      'Age':age,
      'joinedAt':timestamp,
    });

  }
}