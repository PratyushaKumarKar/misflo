import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/pages/doctor.dart';
import 'package:misflo/pages/login.dart';
import 'package:misflo/utils/screentools.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:misflo/widgets/logcrampbutton.dart';
import 'package:misflo/widgets/misboobutton.dart';
import 'package:misflo/widgets/periodtrackbutton.dart';
import 'package:misflo/widgets/todolistview.dart';

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
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or placeholder
          return Center(child: const CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // Handle error
          return Text("Error loading data");
        }

        // Access user data from the snapshot
        var userData = snapshot.data!.data() as Map<String, dynamic>;
        var photoUrl = userData['photoURL'];
        var displayName = userData["displayName"];
        bool firstTimeWidgetUser =
            snapshot.data!['firstTimeWidgetUser'] ?? true;
        bool onPeriod = snapshot.data!['onPeriod'] ?? true;
        var currentDate = DateTime.now();
        DateTime lastPeriodLog =
            (snapshot.data!['periodLastLog'] as Timestamp).toDate() ??
                DateTime.now();
        var difference = currentDate.difference(lastPeriodLog).inDays;
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
            curve: Curves.linear,
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
                        child: TodoListview(
                            scrollController: _scrollController,
                            currentDate: currentDate),
                      ),
                      Positioned(
                        top: height(context, 320),
                        left: width(context, 7),
                        child: PeriodTrackButton(
                            currentDate: currentDate,
                            widget: widget,
                            onPeriod: onPeriod,
                            firstTimeWidgetUser: firstTimeWidgetUser,
                            difference: difference),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: width(context, 14),
                top: height(context, 18),
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
                          child: Text('Log Out'),
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text('My Doctors'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DoctorsPage(user: widget.user)));
                          },
                        ),
                      ],
                    );
                  },
                  child: CircleAvatar(
                    radius: height(context, 27),
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                ),
              ),
              Positioned(
                right: width(context, 12),
                top: height(context, 700),
                child: MisbooButton(widget: widget),
              ),
              Positioned(
                  left: width(context, 12),
                  top: height(context, 700),
                  child: LogCrampButton(widget: widget))
            ],
          ),
        );
      },
    );
  }
}
