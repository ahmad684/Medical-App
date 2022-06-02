import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:animated_horizontal_calendar/utils/calender_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oladoc/Globels.dart';
import 'package:oladoc/Screens/Appointments/ConfirmBooking.dart';
import 'package:oladoc/Widgets/AppBar.dart';

import '../../Constants/Colors.dart';
RxBool checkSlots=true.obs;
var bookedTime='';
var bookedDate='';


var selectedIndex;
class SelectTimeSlot extends StatefulWidget {
  List<dynamic>? slots;
  List<dynamic>? days;

  String? doctorName;
  String? doctorId;
  String? address;
  String? hospitalName;
  String? hospitalId;
  String? imageUrl;
  int?  fee;


  SelectTimeSlot({Key? key,this.slots,this.days,this.doctorName,this.address,this.fee,this.imageUrl,this.hospitalName,this.hospitalId,this.doctorId}) : super(key: key);

  @override
  State<SelectTimeSlot> createState() => _SelectTimeSlotState();
}

class _SelectTimeSlotState extends State<SelectTimeSlot> {
  CheckDays(String dateTime){
    for (var i = 0; i < widget.days!.length; i++) {
      if (widget.days![i].toString().substring(0,3) ==Utils.getDayOfWeek(DateTime.parse(dateTime)) ) {
        print('Using loop: ${widget.days![i]}');
    setState(() {
      checkSlots.value=true;
      bookedDate=dateTime;
    });
        break;

        // Found the person, stop the loop
        return;
      }else{
        print('NotFound');
        print(widget.days![i].toString().substring(0,3));
        print(Utils.getDayOfWeek(DateTime.parse(dateTime)));
        setState(() {
          checkSlots.value=false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  if(widget.days!=null){
    CheckDays(DateTime.now().toString());
  }

  }
  @override
  Widget build(BuildContext context) {
    var selectedDate;
    final double heigth=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: 'Select Time Slot',

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Row
                (
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.imageUrl!),


                      radius: 30,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.doctorName!,style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 18
                        ),),
                        SizedBox(height: 5,),
                        Text(widget.address!,
                          style: TextStyle(color: AppColors.black),
                          overflow: TextOverflow.clip,

                          softWrap: true,),
                        SizedBox(height: 5,),
                        Text("Rs."+widget.fee.toString(),
                          style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,

                          softWrap: true,)

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: AnimatedHorizontalCalendar(
                  tableCalenderIcon: Icon(Icons.calendar_today, color: Colors.white,),
                  date: DateTime.now(),
                  textColor: Colors.black45,
                  backgroundColor: Colors.white,
                  tableCalenderThemeData:  ThemeData.light().copyWith(
                    primaryColor: AppColors.orangeDark,
                    accentColor: AppColors.orangeDark,
                    colorScheme: ColorScheme.light(primary: Colors.green),
                    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  ),
                  selectedColor: Colors.orange,

                  onDateSelected: (date){

                    selectedDate = date;

                    CheckDays(selectedDate);
                    setState(() {
                      bookedDate=selectedDate;
                    });







                  }
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 30),
              child: Text('Available Slots',
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(right: 20),
              child: checkSlots.isTrue?ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount:widget.slots!.length,
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex=index;

                            bookedTime=widget.slots![index].toString();


                          });




                        },
                        child: doctorTimingsData(widget.slots![index].toString(),false,index),
                      );

                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        childAspectRatio: 3
                    ),
                  ),
                ],
              ):Container(
                margin: EdgeInsets.only(left: 25, top: 30),
                child: Text('No free slot Available for this Date',
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
      bottomSheet:  Container(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding:  EdgeInsets.all(width*0.04),
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.customgray,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.access_time),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bookedDate+","+bookedTime),
                        ),

                      ],
                    ))
            ),
            Padding(
                padding:  EdgeInsets.only(left:width*0.04,right:width*0.04),
                child: GestureDetector(
                  onTap: (){
                  setState(() {

                  bookedDate==null||bookedTime==null?Get.snackbar('Error', 'Select Date&Time ',snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.black,colorText: AppColors.white
                   ) :Get.to(()=>ConfirmBooking(hospitalId: widget.hospitalId,doctorName: widget.doctorName,address: widget.address,fee: widget.fee,bookedtime:bookedDate+","+bookedTime ,hospitalName: widget.hospitalName,doctorId: widget.doctorId,imageUrl: widget.imageUrl,));

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
      ),
    );
  }
}
Widget doctorTimingsData(String time,bool isSelected, int index) {
  int ind=index;
  print(ind);



  return  Container(

    margin: EdgeInsets.only(left: 20, top: 10),
    decoration: BoxDecoration(
      color: selectedIndex==ind?AppColors.mediumSlateBlue:AppColors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 2),
          child: Icon(
            Icons.access_time,
            color: selectedIndex==index?AppColors.white:AppColors.black,
            size: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          child: Text(time,
            style: TextStyle(
              color: selectedIndex==index?AppColors.white:AppColors.black,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    ),
  );
}