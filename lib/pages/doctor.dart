import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:misflo/utils/screentools.dart';

class DoctorsPage extends StatefulWidget {
  final User user;
  const DoctorsPage({super.key, required this.user});

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

  // List to hold uploaded documents
  List<Map<String, dynamic>> uploadedDocuments = [];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Scrollable doctors section
            Container(
              height: height(context, 400),
              child: Expanded(
                flex:
                    1, // Adjust the flex factor to control the height of the doctor cards list relative to the tabs section
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: -3,
                          blurRadius: 10.3,
                          offset:
                              const Offset(1, -5), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          BorderRadius.all(Radius.circular(width(context, 35))),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          index: index,
                          length: doctors.length,
                          clinicName: doctors[index]['clinicName']!,
                          doctorName: doctors[index]['doctorName']!,
                          imageUrl: doctors[index]['imageUrl']!,
                          onDelete: () => deleteDoctor(index),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Fixed tabs section
            Expanded(
              flex:
                  1, // Adjust the flex factor to control the height of the tabs section relative to the doctor cards list
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(width(context, 35))),
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
                      tabs: const [
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
                          // Stack(
                          //   children: [
                          //     // Your history content here
                          //     Center(child: Text('Upload Documents')),
                          //     Positioned(
                          //       top: 0,
                          //       right: 0,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: FloatingActionButton(
                          //           onPressed: () async {
                          //             //  UploadDocumentButton(user: widget.user);
                          //             FilePickerResult? result =
                          //                 await FilePicker.platform.pickFiles(
                          //               type: FileType.custom,
                          //               allowedExtensions: [
                          //                 'jpg',
                          //                 'jpeg',
                          //                 'png'
                          //               ],
                          //             );
                          //             if (result != null) {
                          //               PlatformFile file = result.files.first;

                          //               // Create a storage reference
                          //               FirebaseStorage storage =
                          //                   FirebaseStorage.instance;
                          //               Reference ref = storage
                          //                   .ref()
                          //                   .child('uploads/${file.name}');
                          //               UploadTask uploadTask =
                          //                   ref.putFile(File(file.path!));

                          //               // Start the upload task
                          //               uploadTask.then((res) async {
                          //                 final url =
                          //                     await res.ref.getDownloadURL();
                          //                 // Here you can store the URL to Firestore or another service
                          //                 FirebaseFirestore.instance
                          //                     .collection(
                          //                         'users/${widget.user.uid}/documents')
                          //                     .add({
                          //                   'url': url,
                          //                   'name': file.name,
                          //                   'uploaded_at':
                          //                       FieldValue.serverTimestamp(),
                          //                 });

                          //                 ScaffoldMessenger.of(context)
                          //                     .showSnackBar(
                          //                   const SnackBar(
                          //                       content:
                          //                           Text('Upload complete')),
                          //                 );
                          //               }).catchError((e) {
                          //                 ScaffoldMessenger.of(context)
                          //                     .showSnackBar(
                          //                   const SnackBar(
                          //                       content: Text('Upload failed')),
                          //                 );
                          //               });
                          //             } else {
                          //               // User canceled the picker
                          //             }
                          //           },
                          //           child: Icon(Icons.add),
                          //           backgroundColor: const Color(0xFFF4A223),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          UploadedDocumentsManager(
                            user: widget.user,
                            uploadedDocuments: uploadedDocuments,
                            onUploadComplete: (Map<String, dynamic> doc) {
                              setState(() {
                                uploadedDocuments.add(doc);
                              });
                            },
                            onDocumentDeleted: (int index) {
                              setState(() {
                                uploadedDocuments.removeAt(index);
                              });
                            },
                          ),
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
      ),
    );
  }
}

class UploadedDocumentsManager extends StatefulWidget {
  final User user;
  final List<Map<String, dynamic>> uploadedDocuments;
  final Function(Map<String, dynamic>) onUploadComplete;
  final Function(int) onDocumentDeleted;

  const UploadedDocumentsManager({
    Key? key,
    required this.user,
    required this.uploadedDocuments,
    required this.onUploadComplete,
    required this.onDocumentDeleted,
  }) : super(key: key);

  @override
  State<UploadedDocumentsManager> createState() =>
      _UploadedDocumentsManagerState();
}

class _UploadedDocumentsManagerState extends State<UploadedDocumentsManager> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.uploadedDocuments.isEmpty)
          Center(child: Text('Upload Documents')),
        if (widget.uploadedDocuments.isNotEmpty)
          ListView.builder(
            itemCount: widget.uploadedDocuments.length,
            itemBuilder: (context, index) {
              var document = widget.uploadedDocuments[index];
              return ListTile(
                title: Text(path.basename(document['name'])),
                subtitle: Text('Tap to view or edit'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => widget.onDocumentDeleted(index),
                ),
                onTap: () {
                  // Implement viewing functionality
                },
              );
            },
          ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () async {
                // Implement the file picking and upload functionality here
                // After a successful upload, call onUploadComplete with the document info
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;

                  // Create a storage reference
                  FirebaseStorage storage = FirebaseStorage.instance;
                  Reference ref = storage.ref().child('uploads/${file.name}');
                  UploadTask uploadTask = ref.putFile(File(file.path!));

                  // Start the upload task
                  uploadTask.then((res) async {
                    final url = await res.ref.getDownloadURL();
                    // Here you can store the URL to Firestore or another service
                    FirebaseFirestore.instance
                        .collection('users/${widget.user.uid}/documents')
                        .add({
                      'url': url,
                      'name': file.name,
                      'uploaded_at': FieldValue.serverTimestamp(),
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Upload complete')),
                    );
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Upload failed')),
                    );
                  });
                } else {
                  // User canceled the picker
                }
              },
              child: Icon(Icons.add),
              backgroundColor: const Color(0xFFF4A223),
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String clinicName;
  final String doctorName;
  final String imageUrl;
  final VoidCallback onDelete;
  final int length;
  final int index;

  const DoctorCard({
    Key? key,
    required this.clinicName,
    required this.doctorName,
    required this.imageUrl,
    required this.onDelete,
    required this.length,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: height(context, 250),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
                radius: 52.0,
              ),
              Positioned(
                  top: height(context, 26),
                  left: width(context, 154),
                  child: Text(clinicName)),
              Positioned(
                  left: width(context, 154),
                  top: height(context, 56),
                  child: Text(doctorName,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Positioned(
                left: width(context, 10),
                top: height(context, 133),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text('Call'),
                      onPressed: () {
                        // Implement call functionality
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFF4A223)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      child: Text('Book an appointment'),
                      onPressed: () {
                        // Implement booking functionality
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFF4A223)),
                    ),
                  ],
                ),
              ),
              (index != (length - 1))
                  ? Positioned(
                      top: height(context, 210),
                      child: Container(
                        color: Colors.grey,
                        width: width(context, 393),
                        height: 1,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
