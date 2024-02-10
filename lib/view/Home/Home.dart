import 'package:admin_blood/Component/MyDonate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailDonate.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth instance = FirebaseAuth.instance;
  CollectionReference donRef = FirebaseFirestore.instance.collection("Donor");
  void initState(){
    instance.authStateChanges().listen((User? user) {
      if(user != null){
        print("there is a user");
      }
      else{
        Navigator.of(context).pushReplacementNamed("LogIn");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4F4F4),
      appBar: AppBar(
        backgroundColor:Color(0xFFBD2733),
        title: Text("Users",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body:  FutureBuilder(
        future: donRef.where("Validate", isEqualTo: true).get(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder:(context, index){
                  return MyDonate(
                    name: snapshot.data!.docs[index]['Name'],
                    adresse: snapshot.data!.docs[index]['Addresse'],
                    phone: snapshot.data!.docs[index]['Phone'],
                    bloodGroup: snapshot.data!.docs[index]['Blood Groupe'],
                    date: '${snapshot.data!.docs[index]['DateCreateAccount'].toDate()}',
                    urlImage: snapshot.data!.docs[index]['Image'],
                    clickButton: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return DetailsDonate(
                              id: snapshot.data!.docs[index].id,
                              name: snapshot.data!.docs[index]['Name'],
                              phone: snapshot.data!.docs[index]['Phone'],
                              adresse: snapshot.data!.docs[index]['Addresse'],
                              bloodGroupe: snapshot.data!.docs[index]['Blood Groupe'],
                              urlImage: snapshot.data!.docs[index]['Image'],
                              email: snapshot.data!.docs[index]['Email'],
                              age: snapshot.data!.docs[index]['Age'],
                              dateCreateAccount: snapshot.data!.docs[index]['DateCreateAccount'].toDate().toString(),
                            );
                          })
                      );
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