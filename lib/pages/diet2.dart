import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/pages/diet_recipe_detail.dart';
import 'package:misflo/pages/diet_recipies.dart';
// Ensure you have 'screentools.dart' in your project for this to work.
import 'package:misflo/utils/screentools.dart';

class Diet2 extends StatefulWidget {
  const Diet2({Key? key}) : super(key: key);

  @override
  State<Diet2> createState() => _Diet2State();
}

class _Diet2State extends State<Diet2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   top: height(context, 2),
            //   left: width(context, 5),
            //   child: IconButton(
            //     icon: const Icon(Icons.arrow_back_ios),
            //     onPressed: () => Navigator.of(context).pop(),
            //   ),
            // ),

            Positioned(
              top: height(context, 184),
              left: width(context, 5),
              right: width(context, 5),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(34),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(1, -1))
                      ]),
                  height: height(context, 750),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width(context, 20),
                              top: height(context, 43),
                              bottom: height(context, 31)),
                          child: Text(
                            'Search Results',
                            style: GoogleFonts.poppins(
                              fontSize: width(context, 25),
                            ),
                          ),
                        ),
                      ),
                      _buildSearchResults(),
                    ],
                  )),
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
                      borderRadius: BorderRadius.circular(34),
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
                              // Assuming that Diet screen was the previous one, this will take you back to it
                              Navigator.of(context).pop();
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
                      SizedBox(
                        height: height(context, 23),
                      ),
                      Container(
                        height: height(context, 70),
                        width: width(context, 386),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DietRecipes()),
                            );
                          },
                          child: Image.asset("assets/Explore_Banner.png",
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  )),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 27,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button tap for creating diet and workout plan
                  print("load create custom Diet Plan page");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 244, 160, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height(context, 15)),
                  child: Text(
                    'Can' 't find your food? Make your own',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height(context, 20),
                        fontWeight: FontWeight.w500),
                  ),
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: ListView(
        children: [
          _buildSearchResultItem('Egg'),
          _buildSearchResultItem('Egg salad'),
          _buildSearchResultItem('Egg Pav'),
          _buildSearchResultItem('Egg Pie'),
          // Add more items as required
        ],
      ),
    );
  }

  Widget _buildSearchResultItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: Container(
          child: Icon(
            Icons.add,
            color: Color.fromRGBO(244, 162, 35, 100),
          ),
        ),
        onPressed: () {
          print("opening$title ");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DietRecipeDetail()),
          );
        },
      ),
    );
  }
}
