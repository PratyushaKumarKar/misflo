import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DietTracker extends StatelessWidget {
  const DietTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width * 3;
    var screenHeight = MediaQuery.of(context).size.height * 3;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Black Box
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 0.10300429184 * screenHeight, // Set the height dynamically
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                ),
              ),
              // Blackbox_art
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0.02646638054 * screenHeight,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/blackbox_art.png', // assuming blackbox_art is the PNG file name
                        height: 0.0604434907 *
                            screenHeight, // Adjust the height as needed
                        width: 0.27092511013 *
                            screenWidth, // Adjust the width as needed
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            left: 0.02586637298 * screenWidth,
            top: 0.01072961373 * screenHeight,
            child: Container(
              width: 0.02586637298 *
                  screenWidth, // Same height as the Diet Tracker text
              height: 0.01260014306 *
                  screenHeight, // Same height as the Diet Tracker text
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/back_button.svg', // assuming back_button.svg is the SVG file name
                  height: 24, // Adjust height as needed
                  width: 24, // Adjust width as needed
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Diet Tracker Text
          Positioned(
            left: 0,
            top: 0.01072961373 * screenHeight,
            right: 0,
            // Set the height dynamically
            child: Center(
              child: Text(
                'Diet Tracker',
                style: GoogleFonts.poppins(
                  fontSize: 0.01860465116 * screenWidth,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Rectangles with Texts
          Positioned(
            left: 0.03333333333 *
                screenWidth, // Adjust the horizontal position as needed
            top: 0.10622317596 *
                screenHeight, // Adjust the vertical position as needed
            right: 0.03333333333 *
                screenWidth, // Adjust the horizontal position as needed
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRectangularButton('Track your meal',
                        screenWidth * 0.33, screenHeight * 0.25),
                    _buildRectangularButton(
                        'Recipes', screenWidth * 0.33, screenHeight * 0.25),
                    _buildRectangularButton(
                        'Dashboard', screenWidth * 0.33, screenHeight * 0.25),
                  ],
                ),
                SizedBox(height: 16), // Add some space between the rows
                _buildSpecialRectangularButton('Make your food with AI',
                    screenWidth * 0.88, screenHeight * 0.1),
                SizedBox(height: 16), // Add some space between the rectangles
                _buildSecondSpecialRectangularButton(
                    screenWidth * 0.88, screenHeight * 0.1),
              ],
            ),
          ),

          // New Rectangle
          Positioned(
            left: 0.03100775193 * screenWidth,
            bottom: 24, // Adjust the bottom position as needed
            right: 0.03100775193 * screenWidth,
            child: Container(
              height: 60, // Set the height of the rectangle
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add your images here
                  SvgPicture.asset('assets/1.svg'),
                  SvgPicture.asset('assets/2.svg'),
                  SvgPicture.asset('assets/3.svg'),
                  SvgPicture.asset('assets/4.svg'),
                  SvgPicture.asset('assets/5.svg'),
                  SvgPicture.asset('assets/6.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRectangularButton(
      String text, double screenWidth, double screenHeight) {
    return Container(
      width: 0.25 * screenWidth,
      height: 0.10568526466 * screenHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Color.fromARGB(255, 255, 148, 148),
            width: 2), // Change border color and width
        borderRadius: BorderRadius.circular(21),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: 87,
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialRectangularButton(
      String text, double screenWidth, double screenHeight) {
    return Container(
      width: 0.88 * screenWidth, // Adjust width for padding
      height: 0.1700286123 * screenHeight,
      decoration: BoxDecoration(
        color: Color(0xFFCA4E4E),
        border: Border.all(
            color: Color(0xFFCA4E4E),
            width: 2), // Change border color and width
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondSpecialRectangularButton(
      double screenWidth, double screenHeight) {
    return Container(
      width: 0.88 * screenWidth, // Adjust width for padding
      height: 0.2700286123 * screenHeight,
      decoration: BoxDecoration(
        color: Color(0xFFF9BBBB),
        border: Border.all(
            color: Color(0xFFF9BBBB),
            width: 2), // Change border color and width
        borderRadius: BorderRadius.circular(20),
      ),

      child: Stack(children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 0.02093023255 * screenWidth),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.2 kcal',
                    style: GoogleFonts.quicksand(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '4 meals added',
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB14747),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
