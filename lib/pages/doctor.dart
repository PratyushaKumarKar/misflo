import 'package:flutter/material.dart';
import 'package:misflo/utils/screentools.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, String>> doctors = [
    {
      'clinicName': 'Healthline Clinic',
      'doctorName': 'Arundhati Roy',
      'imageUrl': 'assets/doctor1.png',
    },
    {
      'clinicName': 'Healthline Clinic',
      'doctorName': 'Samruddhi Kar',
      'imageUrl': 'assets/doctor2.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
// ==========================Add a doctor functionality

  void addDoctor() {
    // Placeholder for add doctor functionality
    // Update this function to add a new doctor to the list and refresh the UI
    setState(() {
      doctors.add({
        'clinicName': 'New Clinic',
        'doctorName': 'New Doctor',
        'imageUrl':
            'assets/new_doctor.png', // Replace with actual image path for new doctors
      });
    });
  }

// ===========================Delete a doctor
  void deleteDoctor(int index) {
    // Remove doctor from list and refresh UI
    setState(() {
      doctors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('My Doctor', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Scrollable doctors section
          Expanded(
            flex:
                1, // Adjust the flex factor to control the height of the doctor cards list relative to the tabs section
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(
                  clinicName: doctors[index]['clinicName']!,
                  doctorName: doctors[index]['doctorName']!,
                  imageUrl: doctors[index]['imageUrl']!,
                  onDelete: () => deleteDoctor(index),
                );
              },
            ),
          ),
          // Fixed tabs section
          Expanded(
            flex:
                1, // Adjust the flex factor to control the height of the tabs section relative to the doctor cards list
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange,
                    tabs: [
                      Tab(text: 'Appointments'),
                      Tab(text: 'History'),
                      Tab(text: 'Medication'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Replace with actual content
                        Center(child: Text('Appointments Content')),
                        Center(child: Text('History Content')),
                        Center(child: Text('Medication Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Old Float action button here
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String clinicName;
  final String doctorName;
  final String imageUrl;
  final VoidCallback onDelete;

  const DoctorCard({
    Key? key,
    required this.clinicName,
    required this.doctorName,
    required this.imageUrl,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30.0,
            ),
            SizedBox(height: 8.0),
            Text(clinicName),
            Text(doctorName, style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.phone),
                  label: Text('Call'),
                  onPressed: () {
                    // Implement call functionality
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFFF4A223)),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.calendar_today),
                  label: Text('Book an appointment'),
                  onPressed: () {
                    // Implement booking functionality
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFFF4A223)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
