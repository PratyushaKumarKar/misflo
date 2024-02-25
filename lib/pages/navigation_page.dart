import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:misflo/pages/daily_journal.dart';
import 'package:misflo/pages/exercise.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/pages/signup1.dart';
import 'package:misflo/utils/screentools.dart';
import 'package:misflo/pages/diet.dart';
import 'dart:ui' as ui;

//Copy this CustomPainter code to the Bottom of the File

//Copy this CustomPainter code to the Bottom of the File
import 'dart:ui' as ui;

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final double opacity;
  const RPSCustomPainter({required this.opacity});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.08961323, size.height * 0.4324966);
    path_0.cubicTo(
        size.width * 0.08489769,
        size.height * 0.4602475,
        size.width * 0.08232092,
        size.height * 0.4888712,
        size.width * 0.08208723,
        size.height * 0.5181407);
    path_0.lineTo(size.width * 0.01506125, size.height * 0.5603492);
    path_0.cubicTo(
        size.width * 0.1207415,
        size.height * 0.5491271,
        size.width * 0.07836400,
        size.height * 0.6160644,
        size.width * 0.1193925,
        size.height * 0.7180627);
    path_0.cubicTo(
        size.width * 0.1842508,
        size.height * 0.8793051,
        size.width * 0.3268677,
        size.height * 0.9919508,
        size.width * 0.4932431,
        size.height * 0.9935627);
    path_0.cubicTo(
        size.width * 0.6596200,
        size.height * 0.9951746,
        size.width * 0.8661754,
        size.height * 0.9191763,
        size.width * 0.9119292,
        size.height * 0.7180627);
    path_0.cubicTo(
        size.width * 0.9119292,
        size.height * 0.7180627,
        size.width * 0.9307692,
        size.height * 0.5603492,
        size.width * 0.9769231,
        size.height * 0.5603492);
    path_0.cubicTo(
        size.width * 1.023077,
        size.height * 0.5603475,
        size.width * 0.9307692,
        size.height * 0.5501000,
        size.width * 0.9307692,
        size.height * 0.5169492);
    path_0.cubicTo(
        size.width * 0.9307692,
        size.height * 0.4838000,
        size.width * 0.9264031,
        size.height * 0.4618254,
        size.width * 0.9230769,
        size.height * 0.4324966);
    path_0.cubicTo(
        size.width * 0.9307692,
        size.height * 0.2118644,
        size.width * 0.7461538,
        size.height * 0.008474576,
        size.width * 0.4932431,
        size.height * 0.008474593);
    path_0.cubicTo(
        size.width * 0.2769231,
        size.height * 0.008474593,
        size.width * 0.1268417,
        size.height * 0.2134153,
        size.width * 0.08961323,
        size.height * 0.4324966);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(opacity);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NavigationPage extends StatefulWidget {
  final User user;
  const NavigationPage({super.key, required this.user});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentindex = 2;
  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      Diet(user: widget.user),
      DailyJournalPage(), // connect this to firebase later
      Home(user: widget.user),
      Exercise(), // connected to login flow for testing purposes.
      Center(child: Text("Under Development"))
    ];
    return Scaffold(
        body: Pages[_currentindex],
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 54, color: Colors.black),
            Positioned(
              top: (_currentindex == 0)
                  ? height(context, -40)
                  : height(context, 0),
              left: width(context, -3),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentindex = 0;
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  child: Stack(
                    children: [
                      // White circle
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentindex == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      // Yellow circle positioned within the white circle
                      Positioned(
                        top:
                            7, // Adjust this value to position the yellow circle as desired
                        left:
                            7, // Adjust this value to position the yellow circle as desired
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentindex == 0
                                ? Color(0xFFFF920E)
                                : Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      "assets/navbar/diet.svg"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (_currentindex == 1)
                  ? height(context, -40)
                  : height(context, 0),
              left: width(context, 83),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentindex = 1;
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  child: Stack(
                    children: [
                      // White circle
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentindex == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      // Yellow circle positioned within the white circle
                      Positioned(
                        top:
                            7, // Adjust this value to position the yellow circle as desired
                        left:
                            7, // Adjust this value to position the yellow circle as desired
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentindex == 1
                                ? Color(0xFFFF920E)
                                : Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      "assets/navbar/nav_calender.svg"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (_currentindex == 2)
                  ? height(context, -40)
                  : height(context, 0),
              left: width(context, 180),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentindex = 2;
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  child: Stack(
                    children: [
                      // White circle
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentindex == 2
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      // Yellow circle positioned within the white circle
                      Positioned(
                        top:
                            7, // Adjust this value to position the yellow circle as desired
                        left:
                            7, // Adjust this value to position the yellow circle as desired
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentindex == 2
                                ? Color(0xFFFF920E)
                                : Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      "assets/navbar/home.svg"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (_currentindex == 3)
                  ? height(context, -40)
                  : height(context, 0),
              left: width(context, 268),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentindex = 3;
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentindex == 3
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      // Yellow circle positioned within the white circle
                      Positioned(
                        top:
                            7, // Adjust this value to position the yellow circle as desired
                        left:
                            7, // Adjust this value to position the yellow circle as desired
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentindex == 3
                                ? Color(0xFFFF920E)
                                : Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      "assets/navbar/runner.svg"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: (_currentindex == 4)
                  ? height(context, -40)
                  : height(context, 0),
              left: width(context, 356),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentindex = 4;
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  child: Stack(
                    children: [
                      // White circle
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentindex == 4
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      // Yellow circle positioned within the white circle
                      Positioned(
                        top:
                            7, // Adjust this value to position the yellow circle as desired
                        left:
                            7, // Adjust this value to position the yellow circle as desired
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentindex == 4
                                ? Color(0xFFFF920E)
                                : Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      "assets/navbar/community.svg"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
