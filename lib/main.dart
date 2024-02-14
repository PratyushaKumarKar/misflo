import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/pages/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MyApp(
    user: user,
  ));
}

class MyApp extends StatelessWidget {
  final User? user;
  const MyApp({Key? key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 3;
    var screenHeight = MediaQuery.of(context).size.height * 3;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user == null
          ? Login()
          : Home(
              user: user!,
            ),
    );
  }
}

Future<void> _updateUserData(User user) async {
  // Update user data in Firestore
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final DocumentReference userDoc = users.doc(user.uid);

  await userDoc.set({
    'uid': user.uid,
    'displayName': user.displayName,
    'email': user.email,
    'photoURL': user.photoURL,
  });
}

Future<void> _signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User canceled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = authResult.user;

    if (user != null) {
      // User is signed in
      await _updateUserData(user);

      // Navigate to the home screen using the valid context
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  user: user,
                )),
      );

      print('User signed in with Google: ${user.displayName}');
    }
  } catch (e) {
    print('Error signing in with Google: $e');
    // Handle error
  }
}
