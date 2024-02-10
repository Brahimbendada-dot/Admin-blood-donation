
import 'package:admin_blood/Component/ContainerDataDetails.dart';
import 'package:admin_blood/Component/MyButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'EditProfile.dart';
class ProfileDetails extends StatefulWidget {

  String Name;
  int Age;
  String Addresse;
  String Email;
  String Phone;
  String BloodGroupe;
  String Image;
  ProfileDetails({required this.Name,
    required this.Email,
    required this.Age,
    required this.BloodGroupe,
    required this.Phone,
    required this.Addresse,
    required this.Image});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  FirebaseAuth instance = FirebaseAuth.instance;
  DocumentReference DonorRef = FirebaseFirestore.instance.collection("Donor")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0XFFF4F4F4),
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${widget.Image}"),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color:  Color(0XFFF4F4F4),
                          shape: BoxShape.circle
                      ),
                    ),
                  )
              ),
              SizedBox(height: 20,),
              ContainerDataDetails(
                icon: Icon(Icons.person,color: Colors.black,size: 25,),
                title: "Name",
                subTitle: widget.Name,
              ),
              SizedBox(height: 7,),
              ContainerDataDetails(
                icon: Icon(Icons.email,color: Colors.black,size: 25,),
                title: 'Email',
                subTitle: widget.Email,
              ),
              SizedBox(height: 7,),
              ContainerDataDetails(
                icon: Icon(Icons.calendar_today,color: Colors.black,size: 25,),
                title: 'Age',
                subTitle:  '${widget.Age}',
              ),
              SizedBox(height: 7,),
              ContainerDataDetails(
                icon: Icon(Icons.phone,color: Colors.black,size: 25,),
                title: 'Phone',
                subTitle: widget.Phone,
              ),
              SizedBox(height: 7,),
              ContainerDataDetails(
                icon: Icon(Icons.location_on_sharp,color: Colors.black,size: 25,),
                title: 'Addresse',
                subTitle:  widget.Addresse,
              ),
              SizedBox(height: 7,),
              ContainerDataDetails(
                icon: Icon(Icons.group_add,color: Colors.black,size: 25,),
                title: 'Blood Groupe',
                subTitle:  widget.BloodGroupe,
              ),
              SizedBox(height: 15,),
              MyButton(
                color: Color(0xFFBD2733),
                name: "Edit Profile",
                buttonClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context){
                            return EditProfile(
                                Name:widget.Name,
                                Age:widget.Age,
                                Addresse:widget.Addresse,
                                phone: widget.Phone,
                                Image: widget.Image,
                                BloodGroupe: widget.BloodGroupe);
                          }
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
