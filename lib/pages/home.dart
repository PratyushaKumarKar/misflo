import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final User user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width * 3;
    var screenheight = MediaQuery.of(context).size.height * 3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0.01627906977 * screenwidth,
            top: 0.01144492132 * screenheight,
            child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
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

                return CircleAvatar(
                  radius: 0.007153075823 * screenheight,
                  backgroundImage: NetworkImage(photoUrl),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
