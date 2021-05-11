import 'package:flutter/material.dart';
import 'package:social_media_integration_app/CustomWidgets/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_integration_app/provider/googlesignin.dart';
import 'package:social_media_integration_app/provider/faceboogSignin.dart';


class Information extends StatelessWidget {
  String profileUrl,name,email;
  var  Object;
  TextStyle textStyle=TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff555555),
    fontFamily: "Courgette",
    fontSize: 30
  );

  Information({this.profileUrl,this.name,this.email,this.Object});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 80,

            child: CircleAvatar(
              backgroundImage: NetworkImage(this.profileUrl),
              radius: 80,
            ),
          ),

          SizedBox(height:50),
          Center(child: Text("${this.name}",style: textStyle,)),
          SizedBox(height:20),
          Center(child: Text("${this.email}",style:textStyle ,)),
          SizedBox(height:20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: OutlineButton(
              onPressed: () async{
                await Object.logout();
                Object.isLoggedIn=false;
                Navigator.pop(context);
                print("logout");

              },
              child:Text("Log Out",
                style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black

                ),),
              color: Colors.blue,
              padding: EdgeInsets.all(12),
              borderSide: BorderSide(color: Colors.black),


              textColor: Colors.white,


              shape: StadiumBorder(),
            ),
          ),

        ],
      )
    );
  }
}
