// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSigningInAuthServices{

//   signInWithGoogle() async {
//     // BEGIN INTERACTIVE SIGN IN PROCESS
//     final GoogleSignInAccount? googelUser = await GoogleSignIn().signIn();

//     // OBTAIN AUTH DETAILS FROM REQUEST
//     final  GoogleSignInAuthentication googleSignInAuthentication = await googelUser!.authentication;

//     // CREATE NEW CREDENTIALS FOR USER
//     final userCredential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     // SIGNING IN THE USER

//     return await FirebaseAuth.instance.signInWithCredential(userCredential);
//   }
// }