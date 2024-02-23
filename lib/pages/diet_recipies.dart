import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// Ensure you have 'screentools.dart' in your project for this to work.
import 'package:misflo/utils/screentools.dart';

class DietRecipes extends StatefulWidget {
  const DietRecipes({Key? key}) : super(key: key);

  @override
  _DietRecipesState createState() => _DietRecipesState();
}

class _DietRecipesState extends State<DietRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: height(context, 224),
              left: width(context, 5),
              right: width(context, 5),
              child: Container(
                height: MediaQuery.of(context).size.height, // 380px
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(34),
                ),

                // Temporary color to ensure visibility
                child: GridView.builder(
                  shrinkWrap: true, // Add this line
                  primary: false, // Add this line
                  // Set the physics to BouncingScrollPhysics for a better scroll effect on iOS
                  physics: const ScrollPhysics(),
                  // Add some padding to the GridView
                  padding: EdgeInsets.all(width(context, 0)),
                  itemCount: 16, // 2 items per row * 4 rows = 8
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // Make sure this ratio is correct
                    crossAxisCount: 2,
                    crossAxisSpacing: width(context, 10),
                    mainAxisSpacing: height(context, 11),
                  ),

                  itemBuilder: (context, index) {
                    return RecipeCard(
                      imagePath:
                          'assets/CardProduct0.png', // Replace with your actual image path
                      title: 'Yum Fries', // Replace with actual title
                      subtitle: '500 Ks', // Replace with actual subtitle
                      onHeartPressed: () {
                        // Handle heart icon press
                      },
                      onButtonPressed: () {
                        // Handle 'See recipes' button press
                      },
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: height(context, 20),
              left: width(context, 7),
              right: width(context, 7),
              child: Container(
                  height: height(context, 189),
                  width: width(context, 415),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(1, -1))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height(context, 26),
                            bottom: height(context, 0)),
                        child: Row(children: [
                          SizedBox(
                            width: width(context, 22),
                          ),
                          InkWell(
                            onTap: () {
                              print("back button press");
                            },
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.25),
                                    offset: Offset(-1, 1))
                              ]),
                              child: SvgPicture.asset(
                                "assets/back_button_white.svg",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width(context, 19),
                          ),
                          _buildSearchBar()
                        ]),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: height(context, 105), // Adjust the position as needed
              left: width(context, 7),
              right: width(context, 7),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: height(context, 25),
                    horizontal: width(context, 0)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(context, 'Chicken'),
                    _buildButton(context, 'Tandoori'),
                    _buildButton(context, 'Fish'),
                    _buildButton(context, 'Pop'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: height(context, 50),
      width: width(context, 326),
      padding: EdgeInsets.symmetric(
          horizontal: width(context, 5), vertical: height(context, 8)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: height(context, 12)),
            hintText: 'Search',
            hintStyle: GoogleFonts.lato(color: Colors.black),
            prefixIcon: SvgPicture.asset("assets/Search.svg"),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                width(context, 7)), // Add some space between the buttons
        child: ElevatedButton(
          onPressed: () {
            // Handle button tap
          },
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.white,
            backgroundColor:
                Color.fromARGB(255, 255, 255, 255), // Button background color
            foregroundColor: Colors.black, // Button text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
            elevation: 3,
            // Decrease padding if necessary
            padding: EdgeInsets.symmetric(vertical: height(context, 10)),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize:
                  width(context, 12), // Adjust font size to your preference
              overflow:
                  TextOverflow.ellipsis, // Add ellipsis for overflowed text
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onHeartPressed;
  final VoidCallback onButtonPressed;

  const RecipeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onHeartPressed,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, 175),
      height: height(context, 236),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Container(
                  height: height(context, 127),
                  width: width(context, 180),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                      width: width(context, 220.6),
                      height: height(context, 87),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(top: height(context, 150), child: Text("data"))
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               title,
          //               style: const TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 16,
          //               ),
          //             ),
          //             Text(
          //               subtitle,
          //               style: const TextStyle(
          //                 color: Colors.grey,
          //                 fontSize: 14,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.favorite_border),
          //         onPressed: onHeartPressed,
          //         highlightColor: Color(0xFFF4A223),
          //       ),
          //     ],
          //   ),
          // ),
          // Spacer(),
          // Positioned(
          //   top: height(context, 160),
          //   child: ElevatedButton(
          //     onPressed: onButtonPressed,
          //     style: ElevatedButton.styleFrom(
          //       primary: Color(0xFFF4A223),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(9),
          //       ),
          //       minimumSize: Size(
          //           width(context, 220.6), 48), // Fixed height for the button
          //     ),
          //     child: const Text('See recipes'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
