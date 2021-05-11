import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_integration_app/provider/faceboogSignin.dart';
import "CustomWidgets/button.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "package:social_media_integration_app/provider/googlesignin.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_integration_app/information.dart';
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          SizedBox(height:30),
         Expanded( flex: 3,child: Lottie.asset("assets/login.json")),
         Center(child: Text("Social Media Integration",
           style: TextStyle(fontSize: 30,
           fontWeight: FontWeight.bold,
               fontFamily: "Courgette",
           letterSpacing: 1),)),

          Expanded( flex: 2, child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              Expanded( flex:1,child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Task #5",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                    ),),
                  Text("  Assigned By ",
                    style: TextStyle(

                        fontSize: 18
                    ),),
                  Text("The Sparks Foundation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ],
              )),
              Expanded(flex:1,child:CustomBtn(
      color: Colors.red.shade800,
      iconData: FontAwesomeIcons.google,
      providerName: "Google",
                f: googleLogin,
    ),  ),
              Expanded(flex:1,child: CustomBtn(
                color: Colors.blue.shade800,
                iconData: FontAwesomeIcons.facebook,
                providerName: "Facebook",
                f: facebookLogin,
              ),  ),
              SizedBox(height:35),




               Row(children: [Text("Developed By"),
                 Text(" NITIN MALIK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),)],
               mainAxisAlignment: MainAxisAlignment.center,) ,
              SizedBox(height:35),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,

          ),)

        ],
      ),

    );

  }

  googleLogin() async{

  GoogleSignInProvider googlesignin= GoogleSignInProvider();
  GoogleSignIn googleSignIn= await googlesignin.login();
  if( googleSignIn.currentUser.photoUrl!=null)
    {
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>Information(
            profileUrl: googleSignIn.currentUser.photoUrl ,
            email: googleSignIn.currentUser.email,
            name: googleSignIn.currentUser.displayName,
            Object: googlesignin,
          )));
    }
  else{
    print("Denied login");
  }

}
  facebookLogin() async{
    FacebookSigninProvider facebookSigninProvider=FacebookSigninProvider(context);

    var userData=await facebookSigninProvider.LoginToFacebook();
    print("User data : $userData");




  }
}
