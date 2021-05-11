
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  bool isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  login() async{
    try{
      await _googleSignIn.signIn();

        isLoggedIn = true;

    } catch (err){
      print(err);
    }
    return _googleSignIn;
  }

  logout(){
    _googleSignIn.signOut();

      isLoggedIn = false;

  }
}