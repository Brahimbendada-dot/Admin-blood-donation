import 'package:admin_blood/Component/MyButton.dart';
import 'package:admin_blood/Component/showLoading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../DonationApp.dart';

class EditUser extends StatefulWidget {

  String? ID;
  String? Name;
  int? Age;
  String? Addresse;
  String? phone;
  String? Image;
  var BloodGroupe;
  EditUser({
    required this.ID,
    required this.Name,
    required this.Age,
    required this.Addresse,
    required this.phone,
    required this.BloodGroupe,
    required this.Image,
  });

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {


  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  editUser()async{
    var formData = _formKey.currentState;
    if(formData!.validate()){
      formData.save();
      showLoading(context);
      await  FirebaseFirestore.instance.collection("Donor").doc(widget.ID).update({
        'Name':widget.Name,
        'Age':widget.Age,
        "Addresse":widget.Addresse,
        "Blood Groupe" : widget.BloodGroupe,
        "Phone":widget.phone,
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DonationApp(0)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0XFFF4F4F4),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Color(0XFFBD2733),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(150),
                      bottomLeft: Radius.circular(150),
                    ),
                  ),
                  child: Center(
                      child:  Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${widget.Image}"),
                            ),
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color:  Color(0XFFF4F4F4),
                            shape: BoxShape.circle
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 20,),
                Form(
                  key:_formKey,
                  child: Container(
                    margin: EdgeInsets.only(left: 8,right: 8),
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            child: TextFormField(
                              initialValue: widget.Name,
                              onSaved: (val){
                                widget.Name = val;
                              },
                              validator: (val){
                                if(val!.length<2){
                                  return "value is less then 2 letter";
                                }
                                else{
                                  if(val.length>20){
                                    return "value is grate then 20 letter";
                                  }
                                }
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Color(0XFFB5B5B5)
                                ),
                                prefixIcon: Icon(Icons.person,color: Colors.black,),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            child: TextFormField(
                              initialValue: widget.Age.toString(),
                              onSaved: (val){
                                widget.Age = int.parse(val!);
                              },
                              validator: (val){
                                if(val!.length>2){
                                  return "value is grate then 2 number";
                                }
                                if(val.length==0){
                                  return "Enter Age ";
                                }
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Age",
                                hintStyle: TextStyle(
                                    color: Color(0XFFB5B5B5)
                                ),
                                prefixIcon: Icon(Icons.calendar_today,color: Colors.black,),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            child: TextFormField(
                              initialValue: widget.Addresse,
                              onSaved: (val){
                                widget.Addresse = val;
                              },
                              validator: (val){
                                if(val!.length<5){
                                  return 'value is less then 5 letter';
                                }
                                else{
                                  if(val.length>35){
                                    return 'value is grate then 35 letter';
                                  }
                                }
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Addresse",
                                hintStyle: TextStyle(
                                    color: Color(0XFFB5B5B5)
                                ),
                                prefixIcon: Icon(Icons.location_on_sharp,color: Colors.black,),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),

                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              isExpanded:true,
                              hint: Text(widget.BloodGroupe),
                              items: ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
                                  .map((e) => DropdownMenuItem(child: Text("${e}",style: TextStyle(color: Color(0XFFBD2733)),),value: e,)).toList(),
                              onChanged: (val){
                                setState(() {
                                  widget.BloodGroupe = val.toString();
                                });
                              },
                              value: widget.BloodGroupe,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              initialValue:widget.phone,
                              onSaved: (val){
                                widget.phone = val;
                              },
                              validator: (val){
                                if(val!.length != 10){
                                  return 'is not number phone in algeria Country';
                                }
                              },
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                    color: Color(0XFFB5B5B5)
                                ),
                                prefixIcon: Icon(Icons.phone,color: Colors.black,),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),

                          ),
                          SizedBox(height: 20,),
                          MyButton(
                            color: Color(0xFFBD2733),
                            name: "Save Change",
                            buttonClick: ()async{
                              await editUser();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
