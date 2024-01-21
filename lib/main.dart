import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Container(
                  width: 200,
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 48,
                      color: Color(0xFFFF9494), // Hex color FF9494
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
