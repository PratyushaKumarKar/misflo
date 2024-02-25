import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:misflo/utils/screentools.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({
    super.key,
    required ScrollController scrollController,
    required this.currentDate,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 130),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 365, // Number of days to display
        controller: _scrollController,
        itemBuilder: (context, index) {
          // Calculate date for current tile
          var date =
              DateTime(currentDate.year, 1, 1).add(Duration(days: index));
          // Check if it's today's date
          bool isToday = date.isAtSameMomentAs(
              DateTime(currentDate.year, currentDate.month, currentDate.day));
          return Padding(
            padding: EdgeInsets.only(
                top: height(context, 3.0), bottom: height(context, 10.0)),
            child: GestureDetector(
              onTapDown: (details) {
                // Show a blur effect

                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: [
                    PopupMenuItem(
                      child: Text('Option 1'),
                      onTap: () {
                        // Handle option 1 tap
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Option 2'),
                      onTap: () {
                        // Handle option 2 tap
                      },
                    ),
                  ],
                );
              },
              child: Container(
                width: width(context, 84),
                margin: EdgeInsets.symmetric(horizontal: width(context, 4)),
                decoration: BoxDecoration(
                  color: isToday ? Color(0xFFFFB459) : Colors.white,
                  borderRadius: BorderRadius.circular(width(context, 14)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      heightFactor: height(context, 20),
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: height(context, 10)),
                        child: Text(
                          DateFormat('EEEE').format(date).substring(0, 3),
                          style: GoogleFonts.quicksand(
                              fontSize: width(context, 16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        (DateFormat('dd').format(date)[0] == "0")
                            ? DateFormat('dd').format(date)[1]
                            : DateFormat('dd')
                                .format(date), // Format date as 'MMM dd'
                        style: GoogleFonts.quicksand(
                          fontSize: width(context, 40),
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.black : Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
