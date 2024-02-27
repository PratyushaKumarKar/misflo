import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:misflo/pages/signup2.dart';
import 'package:misflo/models/user.dart';

class SignUp1 extends StatefulWidget {
  final User user;
  const SignUp1({super.key, required this.user});

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pronounController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40), // Add spacing
            Text(
              'welcome',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            Text(
              'lets pass two steps to create your detailed experience',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40), // Add spacing
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _pronounController,
              decoration: InputDecoration(labelText: 'Pronouns'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone No.'),
              keyboardType: TextInputType.phone,
            ),

            Spacer(), // Use a Spacer to push the button to the bottom
            SizedBox(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: () {
                  final userInfo = UserProfile(
                    name: _nameController.text,
                    pronouns: _pronounController.text,
                    age: int.tryParse(_ageController.text) ?? 0,
                    weight: double.tryParse(_weightController.text) ?? 0.0,
                    height: double.tryParse(_heightController.text) ?? 0.0,
                    phone: _phoneController.text,
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUp2(
                                user: widget.user,
                                userProfile: userInfo,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Button padding
                  child: Text('Next Step', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _phoneController.dispose();
    _pronounController.dispose();
    super.dispose();
  }
}
