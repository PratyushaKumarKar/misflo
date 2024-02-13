import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misflo/pages/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 3;
    var screenHeight = MediaQuery.of(context).size.height * 3;
    return Builder(builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: const Color(0xFFF9D2D2),
          body: Stack(
            children: [
              Positioned(
                left: 0.01937984496 * screenWidth,
                top: 0.09549356223 * screenHeight,
                child: Text(
                  "Sign in",
                  style: GoogleFonts.poppins(
                    fontSize: 0.01860465116 * screenWidth,
                    color: const Color(0xFF120D26),
                  ),
                ),
              ),
              Positioned(
                left: 0.01860465116 * screenWidth,
                top: 0.1162374821 * screenHeight,
                child: Container(
                  width: 0.2992248062 * screenWidth,
                  height: 0.02217453505 * screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 0.01395348837 * screenWidth),
                        child: SvgPicture.asset(
                          'assets/email.svg',
                          width: 24,
                          height: 24,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 0.01317829457 * screenWidth),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0.01860465116 * screenWidth,
                top: 0.145565093 * screenHeight,
                child: Container(
                  width: 0.2992248062 * screenWidth,
                  height: 0.02217453505 * screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 0.01395348837 * screenWidth),
                        child: SvgPicture.asset(
                          'assets/password.svg',
                          width: 24,
                          height: 24,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 0.01317829457 * screenWidth),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0.1766809728 * screenHeight,
                left: 0.2054263566 * screenWidth,
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 0.01085271318 * screenWidth,
                  ),
                ),
              ),
              Positioned(
                left: 0.03875968992 * screenWidth,
                top: 0.1949213162 *
                    screenHeight, // Adjust the position as needed
                child: Container(
                  width: 0.2558139535 * screenWidth,
                  height: 0.02324749642 * screenHeight,
                  child: TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9494),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.07751937984 * screenWidth),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 0.018 * screenWidth,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.05813953 * screenWidth,
                              right: 0.01162790 * screenWidth),
                          child: SvgPicture.asset(
                            'assets/round_arrow.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.241416309 * screenHeight,
                left: 0.1558139535 * screenWidth,
                child: Text(
                  "OR",
                  style: GoogleFonts.poppins(
                      fontSize: 0.01240310078 * screenWidth,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                left: 0.03875968992 * screenWidth,
                top: 0.2775393419 *
                    screenHeight, // Adjust the position as needed
                child: Container(
                  width: 0.2558139535 * screenWidth,
                  height: 0.02324749642 * screenHeight,
                  child: TextButton(
                    onPressed: () async {
                      await _signInWithGoogle(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.04341085271 * screenWidth,
                          ),
                          child: SvgPicture.asset(
                            'assets/google.svg',
                            width: 0.02403100775 * screenWidth,
                            height: 0.01108726753 * screenHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.01937984496 * screenWidth),
                          child: Text(
                            'Sign in With Google',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 0.01240310078 * screenWidth,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0.06589147287 * screenWidth,
                  top: 0.3118741059 * screenHeight,
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 0.01162790698 * screenWidth),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB14747),
                              fontSize: 0.01162790698 * screenWidth),
                        ),
                      )
                    ],
                  ))
            ],
          ));
    });
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
