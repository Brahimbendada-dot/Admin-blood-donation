
import 'package:admin_blood/Component/MyButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Color(0XFFB80D22),
          body: Stack(
            children: [
              Positioned(
                top: 80,
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Color(0XFFF4F4F4),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          color: Color(0xFF058C42),
                          name: "Add User",
                          buttonClick: (){
                            Navigator.of(context).pushNamed("AddUser");
                          },
                        ),
                        SizedBox(height: 15,),
                        MyButton(
                          color: Color(0xFF058C42),
                          name: "Add Admin",
                          buttonClick: (){
                            Navigator.of(context).pushNamed("AddAdmin");
                          },
                        )

                      ],
                    )
                ),
              ),
              Positioned(
                  top: 45,
                  left: MediaQuery.of(context).size.width*0.5-30,
                  child: Text("Adition",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
              )
            ],
          )
      ),
    );
  }
}
