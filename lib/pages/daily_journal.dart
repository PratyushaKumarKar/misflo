import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:misflo/utils/screentools.dart';

class DailyJournalPage extends StatefulWidget {
  const DailyJournalPage({super.key});

  @override
  State<DailyJournalPage> createState() => _DailyJournalPageState();
}

class _DailyJournalPageState extends State<DailyJournalPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  void _handleTabSelection() {
    if (_tabController.index == 0) {
      // Check if the first tab is selected
      var currentDate = DateTime.now();
      int currentIndex =
          currentDate.difference(DateTime(currentDate.year, 1, 1)).inDays;

      // Scroll to the current date tile
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          currentIndex * width(context, 90.2),
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();

    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    var currentDate = DateTime.now();
    int currentIndex =
        currentDate.difference(DateTime(currentDate.year, 1, 1)).inDays;

    // Scroll to the current date tile
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        currentIndex * width(context, 90.2),
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    });
    return SafeArea(
      child: Stack(
        children: [
          Container(
            child: Image.asset("assets/daily_gallexy.png"),
          ),
          DraggableScrollableSheet(
              maxChildSize: 1,
              minChildSize: 0.7,
              initialChildSize: 0.7,
              expand: true,
              builder: (context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width(context, 35)),
                          topRight: Radius.circular(width(context, 35)))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.orange,
                          tabs: const [
                            Tab(text: 'Logs'),
                            Tab(text: 'Cycle'),
                            Tab(text: 'Summary'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              SingleChildScrollView(
                                controller: scrollController,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: height(context, 700),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: height(context, 20),
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: height(context, 130),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                365, // Number of days to display
                                            controller: _scrollController,
                                            itemBuilder: (context, index) {
                                              // Calculate date for current tile
                                              var date = DateTime(
                                                      currentDate.year, 1, 1)
                                                  .add(Duration(days: index));
                                              // Check if it's today's date
                                              bool isToday = date
                                                  .isAtSameMomentAs(DateTime(
                                                      currentDate.year,
                                                      currentDate.month,
                                                      currentDate.day));
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    top: height(context, 3.0),
                                                    bottom:
                                                        height(context, 10.0)),
                                                child: GestureDetector(
                                                  onTapDown: (details) {
                                                    // Show a blur effect

                                                    showMenu(
                                                      context: context,
                                                      position:
                                                          RelativeRect.fromLTRB(
                                                        details
                                                            .globalPosition.dx,
                                                        details
                                                            .globalPosition.dy,
                                                        details
                                                            .globalPosition.dx,
                                                        details
                                                            .globalPosition.dy,
                                                      ),
                                                      items: [
                                                        PopupMenuItem(
                                                          child:
                                                              Text('Option 1'),
                                                          onTap: () {
                                                            // Handle option 1 tap
                                                          },
                                                        ),
                                                        PopupMenuItem(
                                                          child:
                                                              Text('Option 2'),
                                                          onTap: () {
                                                            // Handle option 2 tap
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  child: Container(
                                                    width: width(context, 84),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: width(
                                                                context, 4)),
                                                    decoration: BoxDecoration(
                                                      color: isToday
                                                          ? Color(0xFFFFB459)
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width(
                                                                  context, 14)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 0,
                                                          blurRadius: 4,
                                                          offset: Offset(2,
                                                              2), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          heightFactor: height(
                                                              context, 20),
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: height(
                                                                        context,
                                                                        10)),
                                                            child: Text(
                                                              DateFormat('EEEE')
                                                                  .format(date)
                                                                  .substring(
                                                                      0, 3),
                                                              style: GoogleFonts.quicksand(
                                                                  fontSize: width(
                                                                      context,
                                                                      16),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            (DateFormat('dd').format(
                                                                            date)[
                                                                        0] ==
                                                                    "0")
                                                                ? DateFormat(
                                                                        'dd')
                                                                    .format(
                                                                        date)[1]
                                                                : DateFormat(
                                                                        'dd')
                                                                    .format(
                                                                        date), // Format date as 'MMM dd'
                                                            style: GoogleFonts
                                                                .quicksand(
                                                              fontSize: width(
                                                                  context, 40),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: isToday
                                                                  ? Colors.black
                                                                  : Colors.grey[
                                                                      800],
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                controller: scrollController,
                                child: Text('History Content'),
                              ),
                              SingleChildScrollView(
                                controller: scrollController,
                                child: Text('Medication Content'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
