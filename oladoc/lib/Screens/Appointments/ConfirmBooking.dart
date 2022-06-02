import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Constants/Colors.dart';
import 'package:oladoc/Screens/Appointments/AppointmentConfirmation.dart';
import 'package:oladoc/Widgets/AppBar.dart';

import '../../Globels.dart';
bool _isMale=false;
bool _isFemale=false;
class ConfirmBooking extends StatefulWidget {
  String? doctorName;
  String? imageUrl;
  String? doctorId;
  String? address;
  String? hospitalName;
  String? hospitalId;
  String? bookedtime;


 int?  fee;
  ConfirmBooking({Key? key,this.doctorName,this.fee,this.address,this.bookedtime,this.hospitalName,this.hospitalId,this.doctorId,this.imageUrl}) : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  addApointment(String doctorName,String patientName,String hospitalName,String time,String location,String Fee,String number,String hospitalid,String docotrId,String url)async{
    await firestore.collection('Appointments').doc().set({
      'doctorName':doctorName,
      'patientName':patientName,
      'date':time,
      'hospitalName':hospitalName,
      'address':location,
      'fee':Fee,
      'patientId':auth.currentUser!.uid,
      'hospitalId':hospitalid,
      'doctorId':docotrId,
      'profileUrl':url



    });


  }
  TextEditingController _name=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _age=TextEditingController();
  var _gender='';
  GetDate()async{
    final ds=
    await firestore.collection('Users').doc(auth.currentUser!.uid).get().then((value) {
      setState(() {
        _name.text=value['UserName'];
        _phone.text=value['phoneNumber'];
        _age.text=value['Age'].toString();
        value['gender']=='Male'?_isMale==true:_isFemale==true;




        // print(ds['userName']);

      });
    });


  }

  @override
  void initState() {
    GetDate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppBar(
            title: 'Confirm Booking'
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Personal Details',style: TextStyle(fontSize: 28),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('We Share these details with Doctor',style: TextStyle(fontSize: 15,color: AppColors.customgray),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: AppColors.scaffoldBackgroundColor,thickness: 2,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Patient Name',style: TextStyle(fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: TextFormField(


                            controller: _name,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mediumSlateBlue, width: 2.0),
                                ),
                                fillColor: AppColors.white,
                                filled: true,
                                hintText: 'Enter Name',

                                border: OutlineInputBorder(

                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Phone Number',style: TextStyle(fontSize: 15),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: _phone,
                            readOnly: true,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),


                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFECECF3), width: 2.0),
                                ),
                                fillColor: AppColors.scaffoldBackgroundColor,
                                filled: true,


                                border: OutlineInputBorder(

                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Age in years',style: TextStyle(fontSize: 15),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: _age,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mediumSlateBlue, width: 2.0),
                                ),
                                fillColor: AppColors.white,
                                filled: true,
                                hintText: 'Enter Age',

                                border: OutlineInputBorder(

                                )
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Gender',style: TextStyle(fontSize: 15),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTap: (){
                              setState(() {
                                _isMale=true;
                                _isFemale=false;
                                _gender='Male';
                              });
                            }

                              ,
                              child: Container(
                                height: heigth*0.06,
                                width:width*0.45 ,
                                decoration: BoxDecoration(
                                    color: _isMale?AppColors.white:AppColors.scaffoldBackgroundColor,
                                    border: Border.all(
                                        color: _isMale?AppColors.mediumSlateBlue:AppColors.customgray
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text('Male')),
                                ),

                              ),
                            ),
                            GestureDetector(onTap: (){
                              setState(() {
                                _isMale=false;
                                _isFemale=true;
                                _gender='Female';
                              });
                            }

                              ,
                              child: Container(
                                height: heigth*0.06,
                                width:width*0.45 ,
                                decoration: BoxDecoration(
                                    color: _isFemale?AppColors.white:AppColors.scaffoldBackgroundColor,
                                    border: Border.all(
                                        color: _isFemale?AppColors.mediumSlateBlue:AppColors.customgray
                                    ),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text('Female')),
                                ),

                              ),
                            ),

                          ],),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: width,
                  color: AppColors.white,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Payment Details',style: TextStyle(fontSize: 28),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('We Share these details with Doctor',style: TextStyle(fontSize: 15,color: AppColors.customgray),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: AppColors.scaffoldBackgroundColor,thickness: 2,),
                      ),
                      Padding(
                          padding:  EdgeInsets.all(width*0.04),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.orangeDark,
                                width: 1
                              ),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0x1EC78224,)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 16.0),
                                 child: Row(
                                   children: [ CircleAvatar(
                                       backgroundColor: AppColors.orangeDark,
                                       radius: 9,
                                       child: Icon(Icons.done_sharp,size: 15,color: AppColors.white,)),
                                     SizedBox(width: 10,),
                                     Text('Pay cash at Clinic',style: TextStyle(fontWeight: FontWeight.bold),),

                                   ],
                                 ),
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text("Rs. "+widget.fee.toString()),
                                ),


                              ],),
                          )
                      )




                    ],
                  ),
                ),
                SizedBox(height: 150,),

                
              ],
            ),
          ),
        ),
        bottomSheet:  Container(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding:  EdgeInsets.all(width*0.01),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.customgray,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.access_time),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(widget.bookedtime!),
                                ),

                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.doctorName!,overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                  )
              ),
              Padding(
                  padding:  EdgeInsets.only(left:width*0.04,right:width*0.04),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        Get.to(()=>AppointmentConfirmation(doctorName: widget.doctorName,patientName: _name.text,address: widget.address,fee: widget.fee,hospitalName: widget.hospitalName,appointmentTime: widget.bookedtime,));
                     addApointment(widget.doctorName!, _name.text, widget.hospitalName!,widget.bookedtime!, widget.address!, widget.fee.toString(), _phone.text,widget.hospitalId!,widget.doctorId!,widget.imageUrl!);



                      });
                    },
                    child: Container(


                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.orangeDark
                      ),
                      child: Center(child: Text('Confirm Booking',style: TextStyle(color: AppColors.white,fontSize: 20),)),
                    ),
                  )
              ),
            ],
          ),
        ),);

  }
}

