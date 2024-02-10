import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class NewUser extends StatelessWidget {

  String bloodGroup;
  String name;
  String phone;
  String adresse;
  String date;
  String urlImage;
  Function() clickButton;
  Function() Reject;
  Function() Accept;
  NewUser({
    required this.name,
    required this.phone,
    required this.adresse,
    required this.date,
    required this.bloodGroup,
    required this.clickButton,
    required this.Reject,
    required this.Accept,
    required this.urlImage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 4,top: 0,right: 4,bottom: 4),
        margin: EdgeInsets.only(top: 5,bottom: 5),
        width: MediaQuery.of(context).size.width,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextButton(
          onPressed: clickButton,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text(this.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.grey,size: 16),
                          SizedBox(width: 3,),
                          Text(this.phone,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, color: Colors.grey,size: 16,),
                          SizedBox(width: 3,),
                          Text(this.adresse,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.grey,size: 16,),
                          SizedBox(width: 3,),
                          Text(this.date,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color:  Color(0XFFF4F4F4),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(this.urlImage),
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 27,
                    child: RaisedButton(
                      color: Color(0xFFBD2733),
                      onPressed: Reject,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Reject",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 90,
                    height: 27,
                    child: RaisedButton(
                      color: Color(0xFF058C42),
                      onPressed: Accept,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Accept",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        )
    );
  }
}
