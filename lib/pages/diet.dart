// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Diet extends StatelessWidget {
//   const Diet({super.key, required User user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daily Journal'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.share),
//             onPressed: () {
//               // Handle share action
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Image.asset('assets/cereal.jpg'), // Replace with your asset path
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Image.asset('assets/soupot.jpg'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('Track upto\n2,000 calories'),
//                   Column(
//                     children: <Widget>[
//                       Icon(Icons.add, color: Colors.green),
//                       Text('500 users tracked their food in last 24 Hrs')
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle button tap for creating diet and workout plan
//               },
//               child: Text('Create your Diet & Workout Plan'),
//             ),
//             Divider(),
//             ListTile(
//               title: Text('Weight goals'),
//               trailing: Text('71.5 kg'),
//             ),
//             Divider(),
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Blogs',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             ListView.builder(
//               physics:
//                   NeverScrollableScrollPhysics(), // to disable ListView's scrolling
//               shrinkWrap:
//                   true, // Use this to make ListView inside Column/SingleChildScrollView
//               itemCount: 4, // Assuming there are 4 blog posts
//               itemBuilder: (BuildContext context, int index) {
//                 // Placeholder for blog post item, replace with your data model
//                 return BlogPostItem(
//                   date: '1ST MAY - SAT 2:00 PM',
//                   title: 'How music helps in weight loss',
//                   author: 'DR. XYZ',
//                   imageUrl:
//                       'assets/blog_post_image_$index.jpg', // Replace with your asset path
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlogPostItem extends StatelessWidget {
//   final String date;
//   final String title;
//   final String author;
//   final String imageUrl;

//   const BlogPostItem({
//     Key? key,
//     required this.date,
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.asset(imageUrl), // Replace with your asset path
//         title: Text(title),
//         subtitle: Text('$date by $author'),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  final User user;

  const Diet({super.key, required this.user});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Journal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Handle share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Adding shadow to the cereal image
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 9,
                    blurRadius: 12,
                    offset: const Offset(2, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                  'assets/cereal.jpg'), // Image path kept as provided
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/soupot.jpg'),
              ),
            ),

            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 19,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button tap for creating diet and workout plan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      // Makes the button stretch to the full width of its parent
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Create your Diet & Workout Plan',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.fromLTRB(16, 16, 16,
                      58), // Increase bottom margin to accommodate the button
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Track upto\n2,000 calories',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '500 users tracked their food in last 24 Hrs',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 24), // Increased space for visual balance
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),
            const ListTile(
              title: Text('Weight goals'),
              trailing: Text('71.5 kg', style: TextStyle(fontSize: 22)),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Blogs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              shrinkWrap:
                  true, // Use this to make ListView inside Column/SingleChildScrollView
              itemCount: 12, // Assuming there are 4 blog posts
              itemBuilder: (BuildContext context, int index) {
                // Placeholder for blog post item, replace with your data model
                return Card(
                  elevation: 1.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(26),
                    // Increase padding to increase height
                    child: BlogPostItem(
                      date: '1ST MAY - SAT 2:00 PM',
                      title: 'How music helps in weight loss',
                      author: 'DR. XYZ',
                      imageUrl:
                          'assets/blog_post_image_$index.jpg', // Image path kept as provided
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPostItem extends StatelessWidget {
  final String date;
  final String title;
  final String author;
  final String imageUrl;

  const BlogPostItem({
    Key? key,
    required this.date,
    required this.title,
    required this.author,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imageUrl), // Image path kept as provided
      title: Text(title),
      subtitle: Text('$date by $author'),
    );
  }
}
