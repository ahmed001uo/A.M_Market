import 'package:ar_market/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/user_data.dart';

class Auth {
  final database = FirestoreDatabase('123');

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final user = FirebaseAuth.instance.currentUser;
    await database.setUserData(UserData(
      uid: user?.uid ?? documentIdFromLocalData(),
      email: googleUser!.email,
    ));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }



  
}
