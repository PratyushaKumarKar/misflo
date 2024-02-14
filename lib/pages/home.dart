import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/utils/screentools.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class Home extends StatelessWidget {
  final User user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width * 3;
    var screenheight = MediaQuery.of(context).size.height * 3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
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
          return SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: width(context, 14),
                  top: height(context, 18),
                  child: CircleAvatar(
                    radius: height(context, 27),
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                ),
                Positioned(
                  top: height(context, 32),
                  left: width(context, 14),
                  child: Text(
                    " Hey! " +
                        toBeginningOfSentenceCase(displayName.split(" ")[0]),
                    style: GoogleFonts.poppins(
                        fontSize: width(context, 20), color: Colors.black),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
