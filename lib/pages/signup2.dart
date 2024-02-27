import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:misflo/pages/navigation_page.dart';

class SignUp2 extends StatefulWidget {
  final User user;

  const SignUp2({super.key, required this.user});
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  DateTime? _lastPeriodDate;
  final TextEditingController _cycleLengthController = TextEditingController();
  final TextEditingController _waistCircumferenceController =
      TextEditingController();
  final TextEditingController _dailyWaterIntakeController =
      TextEditingController();
  bool _hasThyroid = false;
  List<String> goals = [
    'Weight loss',
    'Control Pcos/Pcod',
    'Muscle Building',
    'Meditation',
    'Control Diabetes',
    'Gain Weight',
    'Eat Healthy',
    'Control Thyroid',
    'Regular Periods'
  ];
  List<bool> _selectedGoals = List.generate(9, (index) => false);

  Future<void> _selectLastPeriodDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _lastPeriodDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _lastPeriodDate) {
      setState(() {
        _lastPeriodDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _cycleLengthController.dispose();
    _waistCircumferenceController.dispose();
    _dailyWaterIntakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Tell us more about yourself !',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Last period date',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () => _selectLastPeriodDate(context),
              controller: TextEditingController(
                  text: _lastPeriodDate != null
                      ? DateFormat('yyyy-MM-dd').format(_lastPeriodDate!)
                      : ''),
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Average length of cycle (days)'),
              keyboardType: TextInputType.number,
              controller: _cycleLengthController,
            ),
            SwitchListTile(
              title: Text('Clinically diagnosed thyroid?'),
              value: _hasThyroid,
              onChanged: (bool value) {
                setState(() {
                  _hasThyroid = value;
                });
              },
              secondary: const Icon(Icons.health_and_safety),
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Waist Circumference (cm)'),
              keyboardType: TextInputType.number,
              controller: _waistCircumferenceController,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Daily water intake in Liters'),
              keyboardType: TextInputType.number,
              controller: _dailyWaterIntakeController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'What is your goal?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: List<Widget>.generate(
                goals.length,
                (int index) {
                  return ChoiceChip(
                    label: Text(goals[index]),
                    selected: _selectedGoals[index],
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedGoals[index] = selected;
                      });
                    },
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                        color: _selectedGoals[index]
                            ? Colors.white
                            : Colors.black),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              onPressed: () async {
                final CollectionReference users =
                    FirebaseFirestore.instance.collection('users');

                // Reference to the document for the current user
                final DocumentReference userDoc = users.doc(widget.user.uid);
                await userDoc.update({
                  "profileBuilt": true,
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigationPage(
                            user: widget.user,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Button padding
                child: Text('Start', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
