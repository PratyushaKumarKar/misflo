import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/utils/screentools.dart';

class PeriodTrackButton extends StatelessWidget {
  const PeriodTrackButton({
    super.key,
    required this.currentDate,
    required this.widget,
    required this.onPeriod,
    required this.firstTimeWidgetUser,
    required this.difference,
  });

  final DateTime currentDate;
  final Home widget;
  final bool onPeriod;
  final bool firstTimeWidgetUser;
  final int difference;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, 416),
      height: height(context, 316),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(33),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 2, right: 2),
              child: Container(
                width: width(context, 416),
                height: height(context, 316),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4.9,
                      offset: Offset(0, -3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(33),
                ),
              ),
            ),
            Positioned(
              top: height(context, 55.5),
              left: -width(context, 8),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: height(context, 417.25),
                  width: width(context, 416),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4.9,
                        offset: Offset(-2, -4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height(context, 105),
              left: width(context, 30),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: height(context, 332.25),
                  width: width(context, 338),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC1A0EC),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height(context, 24),
              left: width(context, 24),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFC1A0EC)),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height(context, 2),
                    bottom: height(context, 2),
                    left: width(context, 8),
                    right: width(context, 8),
                  ),
                  child: Text(DateFormat('dd MMMM').format(currentDate)),
                ),
              ),
            ),
            Positioned(
              top: height(context, 142.57),
              left: width(context, 67.68),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onLongPress: () async {
                    try {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget
                              .user.uid) // Assuming you have the user's UID
                          .update({
                        "userinfo.periodLastLog": DateTime.now(),
                        "userinfo.onPeriod": !onPeriod,
                        'firstTimeWidgetUser': false,
                        "onPeriod": !onPeriod,
                        "periodLastLog": DateTime.now(),
                      });

                      print("Update successful");
                    } catch (e) {
                      print("Error updating firstTimeWidgetUser: $e");
                    }
                  },
                  child: Container(
                    height: height(context, 257.54),
                    width: width(context, 260.56),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF211F1F),
                    ),
                    child: Column(
                      children: firstTimeWidgetUser == true
                          ? [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: height(context, 49.0)),
                                child: Text(
                                  "Hold to",
                                  style: GoogleFonts.poppins(
                                    fontSize: width(context, 36),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: height(context, 5.0)),
                                child: Text(
                                  "Start/Stop Cycle",
                                  style: GoogleFonts.poppins(
                                    fontSize: width(context, 16),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]
                          : [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: height(context, 49.0)),
                                child: onPeriod == true
                                    ? Text(
                                        "Periods Started",
                                        style: GoogleFonts.poppins(
                                          fontSize: width(context, 16),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "Periods Ended",
                                        style: GoogleFonts.poppins(
                                          fontSize: width(context, 16),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: height(context, 5.0)),
                                child: Text(
                                  (difference == 0)
                                      ? "Today"
                                      : difference.toString() + " Days ",
                                  style: GoogleFonts.poppins(
                                    fontSize: width(context, 36),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
      ),
    );
  }
}
