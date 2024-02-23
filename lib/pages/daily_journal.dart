import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:misflo/utils/screentools.dart';
import 'package:misflo/widgets/todolistview.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DailyJournalPage extends StatefulWidget {
  const DailyJournalPage({super.key});

  @override
  State<DailyJournalPage> createState() => _DailyJournalPageState();
}

class _DailyJournalPageState extends State<DailyJournalPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  void _animateToCurrentDate() {
    var currentDate = DateTime.now();
    int currentIndex =
        currentDate.difference(DateTime(currentDate.year, 1, 1)).inDays;

    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        currentIndex * width(context, 90.2),
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }
  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            Tab(text: 'Cycles'),
                            Tab(text: 'Summary'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Builder(builder: (context) {
                                // Animate to current date when the Logs tab is visible
                                if (_tabController.index == 0) {
                                  WidgetsBinding.instance.addPostFrameCallback(
                                      (_) => _animateToCurrentDate());
                                }
                                return SingleChildScrollView(
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
                                            child: TodoListview(
                                                scrollController:
                                                    _scrollController,
                                                currentDate: DateTime.now())),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(children: [
                                    SfDateRangePicker(
                                      initialSelectedRange: PickerDateRange(
                                        DateTime.now(),
                                        DateTime.timestamp(),
                                      ),
                                      onSelectionChanged: _onSelectionChanged,
                                      selectionMode:
                                          DateRangePickerSelectionMode.range,
                                      view: DateRangePickerView.month,
                                      toggleDaySelection: false,
                                      monthViewSettings:
                                          DateRangePickerMonthViewSettings(
                                              firstDayOfWeek: 1),
                                    )
                                  ])),
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
