import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurseries/Home/home.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late String _datebook,_no,_agebaby,_nots;

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController datebookcon=TextEditingController();
  TextEditingController notescon=TextEditingController();
  TextEditingController nocon=TextEditingController();
  TextEditingController agecon=TextEditingController();
  late FirebaseDatabase database;
  late FirebaseApp  app;
  late DatabaseReference base;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(

          body: Form(
            key: _formkey,

            child: Container(

              color: Colors.grey.shade100,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                "ادخل بيانات حجز الحضانة",
                                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: TextFormField(

                                validator: (value){
                                  if(value!.isEmpty){
                                    return "من فضلك ادخل تاريخ الحجز";
                                  }
                                  return null;
                                },
                                onSaved: (bookdate){
                                  _datebook=bookdate!;
                                },
                                controller: datebookcon,
                                style: TextStyle(fontFamily: "yel",color: Colors.black),
                                // controller: addRoomProvider.bednocon,
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(color:Colors.black),
                                  ),

                                  hintText: 'ادخل تاريخ الحجز',
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelText: 'تاريخ الحجز',
                                  labelStyle: TextStyle(color: Colors.black),

                                  //prefixText: ' ',
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: TextFormField(

                                validator: (value){
                                  if(value!.isEmpty){
                                    return "من فضلك ادخل عدد الايام";
                                  }
                                  return null;
                                },
                                onSaved: (no){
                                  _no=no!;
                                },
                                controller: nocon,
                                style: TextStyle(fontFamily: "yel",color: Colors.black),
                                // controller: addRoomProvider.bednocon,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(color:Colors.black),
                                  ),

                                  hintText: 'ادخل عدد ايام الحجز',
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelText: 'عدد ايام الحجز',
                                  labelStyle: TextStyle(color: Colors.black),

                                  //prefixText: ' ',
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: TextFormField(

                                validator: (value){
                                  if(value!.isEmpty){
                                    return "من فضلك ادخل عمر الطفل";
                                  }
                                  return null;
                                },
                                onSaved: (age){
                                  _agebaby=age!;
                                },
                                controller: agecon,
                                style: TextStyle(fontFamily: "yel",color: Colors.black),
                                // controller: addRoomProvider.bednocon,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(color:Colors.black),
                                  ),

                                  hintText: 'ادخل عمر الطفل',
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelText: 'عمرالطفل',
                                  labelStyle: TextStyle(color: Colors.black),

                                  //prefixText: ' ',
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: TextFormField(

maxLines:4,
                                controller: notescon,
                                style: TextStyle(fontFamily: "yel",color: Colors.black),
                                // controller: addRoomProvider.bednocon,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(color:Colors.black),
                                  ),

                                  hintText: 'ادخل ملحوظات اضافية ',
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelText: 'ملحوظات اضافية',
                                  labelStyle: TextStyle(color: Colors.black),

                                  //prefixText: ' ',
                                  //suffixText: 'USD',
                                  //suffixStyle: const TextStyle(color: Colors.green)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Container(
                              width: 250,
                              child: ElevatedButton(

                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade500),

                                    shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),
                                            side: BorderSide(color: Colors.orange.shade500)))),
                                child: Text("ارسال طلب الحجز",style: TextStyle(color: Colors.black),),
                                onPressed: () {

                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: TextButton(


                              child: Text("اضغط هنا للعودة",style: TextStyle(color: Colors.grey),),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
