
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
class GetData{
  String? doctorName;
  String? doctorprofileUrl;
  List<dynamic>? slot;
  List<dynamic>? day;

  String? id;
  getData(String i)async{
    await firestore.collection('Doctors').doc(i).get().then((value){
      doctorName=value['doctorName'];


      id=value['id'];

    });

  }
  getHospitalData(String hid)async{

    
    
  }

}