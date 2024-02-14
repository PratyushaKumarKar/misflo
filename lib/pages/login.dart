import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/utils/screentools.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 3;
    var screenHeight = MediaQuery.of(context).size.height * 3;
    return Builder(builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                top: -10,
                left: width(context, 0),
                child: Container(
                  width: width(context, 430),
                  height: height(context, 380),
                  child: Image.asset("assets/login_background.png"),
                ),
              ),
              Positioned(
                top: height(context, 272),
                child: Container(
                  height: height(context, 660),
                  width: width(context, 430),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width(context, 51)),
                          topRight: Radius.circular(width(context, 51)))),
                  child: Stack(
                    children: [
                      Positioned(
                        left: width(context, 44),
                        top: height(context, 32),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 0.01860465116 * screenWidth,
                            color: const Color(0xFF120D26),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width(context, 45),
                        top: height(context, 84),
                        width: width(context, 339),
                        child: Container(
                          width: width(context, 339),
                          height: height(context, 62),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(width(context, 12)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: width(context, 18)),
                                child: SvgPicture.asset(
                                  'assets/email.svg',
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: width(context, 15)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: width(context, 45),
                        top: height(context, 163),
                        width: width(context, 341),
                        child: Container(
                          width: width(context, 341),
                          height: height(context, 62),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(width(context, 12)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: width(context, 18)),
                                child: SvgPicture.asset(
                                  'assets/password.svg',
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: width(context, 15)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: height(context, 248),
                        left: width(context, 247),
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            fontSize: width(context, 14),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width(context, 50),
                        top: height(context, 300),
                        child: Container(
                          width: width(context, 330),
                          height: height(context, 65),
                          child: TextButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFAF61FC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width(context, 100)),
                                  child: Text(
                                    'Sign in',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width(context, 23),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width(context, 75),
                                      right: width(context, 15)),
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
                        top: height(context, 397),
                        left: width(context, 200),
                        child: Text(
                          "OR",
                          style: GoogleFonts.poppins(
                              fontSize: width(context, 16),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                        left: 0.03875968992 * screenWidth,
                        top: height(context, 463),
                        child: Container(
                          width: 0.2558139535 * screenWidth,
                          height: 0.02324749642 * screenHeight,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _signInWithGoogle(context);
                            },
                            style: TextButton.styleFrom(
                              elevation: 10,
                              surfaceTintColor: Colors.white,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width(context, 15.0)),
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: width(context, 24),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/google.svg',
                                    width: 0.02403100775 * screenWidth,
                                    height: 0.01108726753 * screenHeight,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: width(context, 24)),
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
                          left: width(context, 82),
                          top: height(context, 586),
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
                                      color: Color(0xFFAF61FC),
                                      fontSize: 0.01162790698 * screenWidth),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
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
