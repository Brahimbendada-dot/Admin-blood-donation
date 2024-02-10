
import 'dart:convert';

import 'package:admin_blood/Component/newUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Appointement extends StatelessWidget {


  CollectionReference appointementRef = FirebaseFirestore.instance.collection("Appointement");
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFBD2733),
        title: Text("Appointement"),
      ),
      body: Center(
        child: FutureBuilder(
          future: appointementRef.where("Validate Appointement",isEqualTo: false).get(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:(context, index){
                    return NewUser(
                      name: snapshot.data!.docs[index]['Name'],
                      adresse: snapshot.data!.docs[index]['Addresse'],
                      phone: snapshot.data!.docs[index]['Phone'],
                      bloodGroup: snapshot.data!.docs[index]['Blood Groupe'],
                      clickButton: (){},
                      date: '${snapshot.data!.docs[index]['Date Appointement']}',
                      urlImage: snapshot.data!.docs[index]['Image'],
                      Accept: () async{
                        await appointementRef.doc(snapshot.data!.docs[index].id).update({
                          'Validate Appointement': true,
                        });
                        getDeviceToken().then((value) async{
                          var data = {
                                'to' : snapshot.data!.docs[index]['Token'].toString(),
                               'notification' : {
                                   'title' : 'Appointement' ,
                                    'body' : 'your Appointement in ${snapshot.data!.docs[index]['Date Appointement']}' ,
                                      "sound": "jetsons_doorbell.mp3"
                                }
                          };
                          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                          body: jsonEncode(data),
                            headers: {
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization' : 'key=AAAANZefvOM:APA91bE-3eq0xM-iaRm3k-yE1294N5__lYryilupdD5aZG2t4usXdCRPAEz5lfQJwHQL--toSBmJ5VEegTxsq40wSXbN-RMAFWdeh5LXQ9HbjTMOMjwE3VABo-ULVqie_S0tKe1mgFXd',
                           }
                          );
                        });
                      }, Reject: () async{
                      await appointementRef.doc(snapshot.data!.docs[index].id).delete();
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
      ),
    );
  }
}
