import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/pages/diet2.dart';
import 'package:misflo/utils/screentools.dart';

class Diet extends StatefulWidget {
  final User user;

  const Diet({super.key, required this.user});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Positioned(
          //     left: width(context, 15),
          //     top: height(context, 20),
          //     child: InkWell(
          //         onTap: () {
          //           print("back button press");
          //         },
          //         child: SvgPicture.asset("assets/back_button.svg"))),
          Positioned(
            child: Text(
              "Diet Journal",
              style: GoogleFonts.poppins(
                fontSize: width(context, 26),
                fontWeight: FontWeight.w500,
              ),
            ),
            top: height(context, 20),
            left: width(context, 125),
          ),
          Positioned(
            top: height(context, 73),
            left: 0,
            child: Container(
              height: height(context, 801),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: height(context, 7)),
                  child: Column(
                    children: <Widget>[
                      // Adding shadow to the cereal image
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width(context, 0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: height(context, 285),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 9,
                                blurRadius: 12,
                                offset: const Offset(
                                    2, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.asset(

                            'assets/cereal.jpg',
                            fit: BoxFit.contain,
                          ), // Image path kept as provided
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height(context, 10)),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: width(context, 5)),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/soupot.jpg',
                              fit: BoxFit.fill,
                              width: width(context, 418),
                              height: height(context, 121),
                            ),
                          ),
                        ),
                      ),

                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Positioned(
                            left: width(context, 6),
                            right: width(context, 6),
                            bottom: height(context, 15),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap for creating diet and workout plan
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFB459),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                ),

                                // Makes the button stretch to the full width of its parent
                                minimumSize: const Size.fromHeight(60),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Create your Diet & Workout Plan',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 3,
                                    blurRadius: 4.5,
                                    offset: Offset(1, 4),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width(context, 22)))),
                            margin: EdgeInsets.fromLTRB(
                                width(context, 6),
                                16,
                                width(context, 6),
                                58), // Increase bottom margin to accommodate the button
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Diet2()),
                                          );
                                        },
                                        child: Container(
                                          height: 48,
                                          width: 48,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                      height:
                                          24), // Increased space for visual balance
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(),
                      const ListTile(
                        title: Text('Weight goals'),
                        trailing:
                            Text('71.5 kg', style: TextStyle(fontSize: 22)),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Blogs',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
              ),
            ),
          ),
        ],
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
