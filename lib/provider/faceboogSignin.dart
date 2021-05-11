import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import "package:flutter/material.dart";
import 'package:social_media_integration_app/information.dart';
class FacebookSigninProvider{
  bool isLoggedIn = false;
  Map userObj = {};
  BuildContext context;
  FacebookSigninProvider(this.context);


  LoginToFacebook() async {
  FacebookAuth.instance.login(
  permissions: ["public_profile", "email"]).then((value) {
    FacebookAuth.instance.getUserData().then((userData) {

      userObj = userData;
      isLoggedIn = true;
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>Information(
            profileUrl: userObj["picture"]["data"]["url"] ,
            email: userObj["email"],
            name: userObj["name"],
            Object: this,
          )));
    });
  });
  return await userObj;

  }

  logout() async {
    FacebookAuth.instance.logOut().then((value) {

        isLoggedIn = false;
        userObj = {};
      });}
}
