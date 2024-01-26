import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 3;
    var screenHeight = MediaQuery.of(context).size.height * 3;
    return MaterialApp(
      home: Scaffold(
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
              top: 0.1162374821 * screenHeight, // Adjust the position as needed
              child: Container(
                width: 0.2992248062 * screenWidth,
                height: 0.02217453505 * screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white, // Assuming you want a white background
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
                        color: Colors.black, // Set the desired color
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 0.01317829457 * screenWidth),
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
              top: 0.145565093 * screenHeight, // Adjust the position as needed
              child: Container(
                width: 0.2992248062 * screenWidth,
                height: 0.02217453505 * screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white, // Assuming you want a white background
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
                        color: Colors.black, // Set the desired color
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 0.01317829457 * screenWidth),
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
          ],
        ),
      ),
    );
  }
}
