
import 'package:admin_blood/Component/ContainerDataDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'EditUser.dart';

class DetailsDonate extends StatelessWidget {


  String id;
  String bloodGroupe;
  String name;
  String phone;
  String adresse;
  String email;
  int age;
  String dateCreateAccount;
  String urlImage;
  DetailsDonate({
    required this.id,
    required this.name,
    required this.phone,
    required this.adresse,
    required this.bloodGroupe,
    required this.email,
    required this.age,
    required this.dateCreateAccount,
    required this.urlImage,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding:EdgeInsets.only(top: 30,left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: Color(0xFFBD2733),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(onPressed: (){
                                Navigator.of(context).pop();
                               }, icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("USERNAME",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  Text(this.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_pin, color: Colors.white, size: 20,),
                                  Text("ADDRESSE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text("ALGERIA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(this.adresse,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  Container(
                    child: Container(
                      width:100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(this.urlImage)
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  ContainerDataDetails(
                    icon: Icon(Icons.email,color: Colors.black,size: 25,),
                    title: 'Email',
                    subTitle: this.email,
                  ),
                  SizedBox(height: 7,),
                  ContainerDataDetails(
                    icon: Icon(Icons.calendar_today,color: Colors.black,size: 25,),
                    title: 'Age',
                    subTitle:  '${this.age}',
                  ),
                  SizedBox(height: 7,),
                  ContainerDataDetails(
                    icon: Icon(Icons.phone,color: Colors.black,size: 25,),
                    title: 'Phone',
                    subTitle: this.phone,
                  ),
                  SizedBox(height: 7,),
                  ContainerDataDetails(
                    icon: Icon(Icons.date_range_rounded,color: Colors.black,size: 25,),
                    title: 'Date Create Account',
                    subTitle:  this.dateCreateAccount,
                  ),
                  SizedBox(height: 7,),
                  ContainerDataDetails(
                    icon: Icon(Icons.group_add,color: Colors.black,size: 25,),
                    title: 'Blood Groupe',
                    subTitle:  this.bloodGroupe,
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      color: Color(0xFF058C42),
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(this.phone);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Call",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          Icon(Icons.phone,size: 22, color: Color(0xFF6CDC2D),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      color: Color(0xFF058C42),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>EditUser(
                            Addresse: this.adresse,
                            phone:this.phone,
                            Name: this.name,
                            Age: this.age,
                            BloodGroupe: this.bloodGroupe,
                            Image:this.urlImage,
                            ID:this.id,
                           )
                          )
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Edit User",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          Icon(Icons.edit,size: 22, color: Color(0xFF6CDC2D),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      color: Color(0xFFB80D22),
                      onPressed: () async {
                        await FirebaseFirestore.instance.collection("Donor").doc(this.id).delete();
                        Navigator.of(context).pushReplacementNamed("DonationApp");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delete user",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          Icon(Icons.delete,size: 22, color: Color(0xFFF46677),)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
