import 'package:admin_blood/Component/newUser.dart';
import 'package:admin_blood/Component/showLoading.dart';
import 'package:admin_blood/view/DonationApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {




  @override
  _NotifyState createState() => _NotifyState();
}
class _NotifyState extends State<Notify> {

  var DonId;
  FirebaseAuth instance = FirebaseAuth.instance;
  CollectionReference donRef = FirebaseFirestore.instance.collection("Donor");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4F4F4),
      appBar: AppBar(
        backgroundColor:Color(0xFFBD2733),
        title: Text("New users",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body:  FutureBuilder(
        future: donRef.where("Validate", isEqualTo: false).get(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder:(context, index){
                  return NewUser(
                    Reject: ()async{
                      await FirebaseFirestore.instance.collection("Donor")
                          .doc(snapshot.data!.docs[index].id).delete();
                      showLoading(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>DonationApp(2))
                      );
                    },
                    Accept: ()async{
                      await FirebaseFirestore.instance.collection("Donor").doc(snapshot.data!.docs[index].id).update({
                        "Validate":true
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>DonationApp(2))
                      );
                    },
                    name: snapshot.data!.docs[index]['Name'],
                    adresse: snapshot.data!.docs[index]['Addresse'],
                    phone: snapshot.data!.docs[index]['Phone'],
                    bloodGroup: snapshot.data!.docs[index]['Blood Groupe'],
                    date: '${snapshot.data!.docs[index]['DateCreateAccount'].toDate()}',
                    urlImage: snapshot.data!.docs[index]['Image'],
                    clickButton: (){
                    },
                  );
                }
            );
          }
          return Center(child: CircularProgressIndicator(
            color: Color(0xFFBD2733),
          ));
        },

      ),
    );
  }
}
/*

 */