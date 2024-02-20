import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/utils/screentools.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class Home extends StatefulWidget {
  final User user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = OverlayEntry(builder: (context) => SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width * 3;
    var screenheight = MediaQuery.of(context).size.height * 3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.user.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator or placeholder
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            // Handle error
            return Text("Error loading data");
          }

          // Access user data from the snapshot
          var userData = snapshot.data!.data() as Map<String, dynamic>;
          var photoUrl = userData['photoURL'];
          var displayName = userData["displayName"];
          var currentDate = DateTime.now();
          var januaryFirstIndex =
              currentDate.difference(DateTime(currentDate.year, 1, 1)).inDays;
          print(januaryFirstIndex);

          final ScrollController _scrollController = ScrollController();

          // Calculate the index of the current date
          int currentIndex =
              currentDate.difference(DateTime(currentDate.year, 1, 1)).inDays;

          // Scroll to the current date tile
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            _scrollController.animateTo(
              currentIndex * width(context, 90.2),
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
            );
          });
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: height(context, 1342),
                    width: width(context, 430),
                    child: Stack(
                      children: [
                        Positioned(
                          top: height(context, 32),
                          left: width(context, 14),
                          child: Text(
                            "👋 Hey! " +
                                toBeginningOfSentenceCase(
                                    displayName.split(" ")[0]),
                            style: GoogleFonts.poppins(
                                fontSize: height(context, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: height(context, 92),
                          left: width(context, 15),
                          child: Text(
                            "we wish you have a nice day",
                            style: GoogleFonts.poppins(
                                fontSize: width(context, 14),
                                color: Color(0xFF746F6F)),
                          ),
                        ),
                        Positioned(
                          top: height(context, 112),
                          left: width(context, 15),
                          child: Text(
                            "Good Morning " +
                                toBeginningOfSentenceCase(
                                    displayName.split(" ")[0]) +
                                ",",
                            style: GoogleFonts.poppins(
                                fontSize: width(context, 26),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Positioned(
                          top: height(context, 174),
                          left: 0,
                          right: 0,
                          child: Container(
                            height: height(context, 130),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 365, // Number of days to display
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                // Calculate date for current tile
                                var date = DateTime(currentDate.year, 1, 1)
                                    .add(Duration(days: index));
                                // Check if it's today's date
                                bool isToday = date.isAtSameMomentAs(DateTime(
                                    currentDate.year,
                                    currentDate.month,
                                    currentDate.day));
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: height(context, 3.0),
                                      bottom: height(context, 10.0)),
                                  child: GestureDetector(
                                    onTapDown: (details) {
                                      // Show a blur effect

                                      showMenu(
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                          details.globalPosition.dx,
                                          details.globalPosition.dy,
                                          details.globalPosition.dx,
                                          details.globalPosition.dy,
                                        ),
                                        items: [
                                          PopupMenuItem(
                                            child: Text('Option 1'),
                                            onTap: () {
                                              // Handle option 1 tap
                                            },
                                          ),
                                          PopupMenuItem(
                                            child: Text('Option 2'),
                                            onTap: () {
                                              // Handle option 2 tap
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                    child: Container(
                                      width: width(context, 84),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width(context, 4)),
                                      decoration: BoxDecoration(
                                        color: isToday
                                            ? Color(0xFFFFB459)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            width(context, 14)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            heightFactor: height(context, 20),
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: height(context, 10)),
                                              child: Text(
                                                DateFormat('EEEE')
                                                    .format(date)
                                                    .substring(0, 3),
                                                style: GoogleFonts.quicksand(
                                                    fontSize:
                                                        width(context, 16),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              (DateFormat('dd')
                                                          .format(date)[0] ==
                                                      "0")
                                                  ? DateFormat('dd')
                                                      .format(date)[1]
                                                  : DateFormat('dd').format(
                                                      date), // Format date as 'MMM dd'
                                              style: GoogleFonts.quicksand(
                                                fontSize: width(context, 40),
                                                fontWeight: FontWeight.bold,
                                                color: isToday
                                                    ? Colors.black
                                                    : Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: width(context, 14),
                  top: height(context, 18),
                  child: CircleAvatar(
                    radius: height(context, 27),
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
