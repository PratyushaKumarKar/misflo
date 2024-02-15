import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:misflo/utils/screentools.dart';

class NavigationPage extends StatefulWidget {
  final User user;
  const NavigationPage({super.key, required this.user});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(height: 54, color: Colors.black),
        Positioned(
          top: (_currentindex == 0) ? height(context, -50) : height(context, 0),
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
                              child: SvgPicture.asset("assets/navbar/diet.svg"))
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
          top: (_currentindex == 1) ? height(context, -50) : height(context, 0),
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
          top: (_currentindex == 2) ? height(context, -50) : height(context, 0),
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
                              child: SvgPicture.asset("assets/navbar/home.svg"))
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
          top: (_currentindex == 3) ? height(context, -50) : height(context, 0),
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
                  // White circle
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
                              child:
                                  SvgPicture.asset("assets/navbar/runner.svg"))
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
          top: (_currentindex == 4) ? height(context, -50) : height(context, 0),
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
