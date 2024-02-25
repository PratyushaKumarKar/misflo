import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/utils/screentools.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Text(
              "Yoga & Meditation",
              style: GoogleFonts.poppins(
                fontSize: width(context, 26),
                fontWeight: FontWeight.w500,
              ),
            ),
            top: height(context, 20),
            left: width(context, 103),
          ),
          Positioned(
            top: height(context, 73),
            left: 0,
            child: Container(
              height: height(context, 801),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Container(
                  height: height(context, 1423),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: width(context, 5),
                        right: width(context, 5),
                        child: Image.asset("assets/yoga_banner.png"),
                      ),
                      Positioned(
                        top: height(context, 290),
                        left: width(context, 6),
                        right: width(context, 6),
                        child: Container(
                          height: height(context, 129),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFB459),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                width(context, 22),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width(context, 14.0),
                                      top: height(context, 10)),
                                  child: Text(
                                    "28 - Day Meditation challenge",
                                    style: GoogleFonts.poppins(
                                        fontSize: width(context, 16)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width(context, 14),
                                    right: width(context, 14),
                                    top: height(context, 18)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFC1A0EC)),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "4",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "5",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "6",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height(context, 52),
                                      width: width(context, 52),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "7",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: height(context, 383),
                        left: width(context, 6),
                        right: width(context, 6),
                        child: Container(
                          height: height(context, 83),
                          width: width(context, 419),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(width(context, 22)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(3, 1),
                                  spreadRadius: 3,
                                  blurRadius: 4.9,
                                  color: Colors.black.withOpacity(0.25))
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: height(context, 11),
                                left: width(context, 17),
                                child: Text(
                                  "Log your meditation ",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width(context, 20)),
                                ),
                              ),
                              Positioned(
                                top: height(context, 45),
                                left: width(context, 17),
                                child: Container(
                                  height: 1,
                                  width: width(context, 292),
                                  color: Colors.white.withOpacity(0.30),
                                ),
                              ),
                              Positioned(
                                top: height(context, 51),
                                left: width(context, 17),
                                child: Text(
                                  "500 users tracked their meditation in last 24 Hrs",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width(context, 12)),
                                ),
                              ),
                              Positioned(
                                  top: height(context, 19),
                                  right: width(context, 7),
                                  bottom: height(context, 12),
                                  child: SvgPicture.asset(
                                      "assets/add_button_exer.svg")),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: height(context, 495),
                        left: width(context, 13),
                        child: Text(
                          "Popular Workouts",
                          style: GoogleFonts.poppins(
                              fontSize: width(context, 24),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 430),
                        child: Container(
                          height: height(context, 319),
                          child: ListView(
                            itemExtent: 300,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Image.asset("assets/workout_1.png"),
                              ),
                              Image.asset("assets/workout_2.png")
                            ],
                            shrinkWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
