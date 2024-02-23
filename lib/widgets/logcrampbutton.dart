import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/utils/screentools.dart';

class LogCrampButton extends StatelessWidget {
  const LogCrampButton({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onLongPress: () async {
        DocumentReference userDoc =
            FirebaseFirestore.instance.collection('users').doc(widget.user.uid);

        // Get the current timestamp
        Timestamp now = Timestamp.now();
        // Update the user's document by adding the new timestamp to the 'logCrampList' array
        // This uses the arrayUnion method to ensure the timestamp is added to the array without removing existing entries
        await userDoc.update({
          'logCrampList': FieldValue.arrayUnion([now]),
        }).then((_) {
          // If the update is successful, show a toast message
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Cramps Logged !')));
        }).catchError((error) {
          // If there is an error during the update, show a different toast message
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Cramps could not be logged')));
        });
      },
      child: Image.asset(
        "assets/logcramps.png",
        height: height(context, 95),
        width: width(context, 95),
      ),
    );
  }
}
