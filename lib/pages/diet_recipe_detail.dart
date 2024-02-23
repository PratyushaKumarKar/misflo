import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misflo/utils/screentools.dart';

class DietRecipeDetail extends StatelessWidget {
  const DietRecipeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the vertical scroll lists
    final List<String> quantities = ['0.75', '1.00', '1.25'];
    final List<String> units = ['Ozs', 'grams', 'Piece'];
    // Dummy data for the Macronutrients Breakdown
    final Map<String, String> macronutrients = {
      'Proteins': '5g',
      'Carbs': '21g',
      'Fats': '5g',
      'Calcium': '5g',
      'Fiber': '5g',
    };

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            //P1:Background image 'cereal.jpg'
            Positioned(
              top: height(context, 0),
              bottom: height(context, 636),
              left: width(context, 0),
              right: width(context, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(-1, 1))
                    ]),
                child: Image.asset(
                  'assets/cereal.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //P2:Back button
            Positioned(
              top: 10, // Adjust the padding as needed
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  print("back button press");
                },
                child: Container(
                  padding: const EdgeInsets.all(8), // Padding for the tap area
                  child: SvgPicture.asset(
                    'assets/back_button_white.svg',
                    width: 32, // Your SVG file size
                  ),
                ),
              ),
            ),

            //P3: Food Item Title and subtitle container
            Positioned(
              top: height(context, 150), // Adjust as necessary for your layout
              left: width(context, 20),
              right: width(context, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Egg salad',
                    style: GoogleFonts.poppins(
                        fontSize: width(context, 25), color: Colors.white),
                  ),
                  SizedBox(
                      height: height(
                          context, 4)), // Space between title and subtitle
                  Text(
                    '120 - 140 g',
                    style: GoogleFonts.poppins(
                      fontSize: width(context, 16),
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // P4: Pick the Quantity container with CupertinoPicker
            Positioned(
              top: height(context, 208), // Adjust as necessary for your layout
              left: width(context, 0),
              right: width(context, 0),
              bottom: height(context, 505),
              child: Container(
                padding: EdgeInsets.only(
                  top: height(context, 35),
                  left: width(context, 25),
                  right: width(context, 25),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(-1, 1))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick the quantity',
                      style: GoogleFonts.poppins(
                        fontSize: width(context, 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            // Quantity Picker
                            child: buildCupertinoPicker(
                                context, quantities, false),
                          ),
                          SizedBox(
                              width: width(
                                  context, 16)), // Space between the pickers
                          Expanded(
                            // Unit Picker
                            child: buildCupertinoPicker(context, units, false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // P5: Share button
            Positioned(
              top: height(context, 234), // Adjust as necessary for your layout
              right: width(context, 21),
              child: Container(
                height: height(context, 40),
                width: width(context, 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(-1, 1))
                    ]),
                child: IconButton(
                  icon: Icon(Icons.share, color: Colors.black),
                  //SvgPicture.asset(
                  //  'assets/share.svg'), // Replace with actual asset path
                  iconSize: width(context, 24),
                  onPressed: () {
                    // TODO: Implement share functionality
                    print("share the selected food item, open a share modal");
                  },
                ),
              ),
            ),

// P6: Macronutrients Breakdown container
            Positioned(
              top: height(context, 400), // Adjust the position as necessary
              left: width(context, 0),
              right: width(context, 0),
              bottom: height(context, 67),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height(context, 20),
                  horizontal: width(context, 25),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(-1, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Macronutrients Breakdown',
                      style: GoogleFonts.poppins(
                        fontSize: width(context, 18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height(context, 10)),
                    ...macronutrients.entries.map((entry) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height(context, 14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: GoogleFonts.poppins(
                                  fontSize: width(context, 16),
                                ),
                              ),
                              Text(
                                entry.value,
                                style: GoogleFonts.poppins(
                                  fontSize: width(context, 16),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            // P7: Add button using ElevatedButton
            Positioned(
              left: width(context, 2),
              right: width(context, 2),
              bottom: height(context, 5),
              child: SizedBox(
                width: double.infinity,
                height: height(context, 56), // Fixed height for the button
                child: ElevatedButton(
                  onPressed: () {
                    print("food item {insert from db} added");
                    // TODO: Implement the add action
                    Navigator.of(context).pop();
                    //Add food item prompt
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 244, 160, 35),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Button border radius
                    ),
                  ),
                  child: Text(
                    'ADD',
                    style: GoogleFonts.poppins(
                      fontSize: width(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//P4:Scroll listview for measurements and quantity widget builder
Widget _buildQuantityItem(BuildContext context, String text, bool isQuantity) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: width(context, 20), // Adjust font size as necessary
        fontWeight: isQuantity ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

//P4: Cupertino picker widget for vertical scroll
Widget buildCupertinoPicker(
    BuildContext context, List<String> itemList, bool isQuantity) {
  return Container(
    height: height(context, 120), // Height of the entire picker container
    color: Colors.white, // Background color of the picker
    child: CupertinoPicker(
      itemExtent: height(context, 40), // Height of each item in the picker
      useMagnifier: true,
      magnification: 1.1,
      onSelectedItemChanged: (int index) {
        // Handle the selected item change
        print("Selected item: ${itemList[index]}");
      },
      children: itemList.map((String item) {
        return Container(
          alignment: Alignment.center,
          decoration: isQuantity
              ? null
              : BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black, // Color of the divider
                      width: 0.5, // Thickness of the divider
                    ),
                    top: BorderSide(
                      color: Colors.black, // Color of the divider
                      width: 0.5, // Thickness of the divider
                    ),
                  ),
                ),
          child: Text(
            item,
            style: GoogleFonts.poppins(
              color: Colors.black, // Color of the text
              fontSize: width(context, 20), // Font size of the text
              fontWeight: FontWeight.w300,
            ),
          ),
        );
      }).toList(),
    ),
  );
}
