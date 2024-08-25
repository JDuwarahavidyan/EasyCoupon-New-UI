import 'dart:ui'; // Import for BackdropFilter
import 'package:flutter/material.dart';
import 'my_diary/my_diary_screen.dart';
import 'package:easy_coupon/widgets/common/bottom_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:easy_coupon/widgets/components/background.dart';

class TabIconData {
  final IconData icon;
  bool isSelected;

  TabIconData(this.icon, this.isSelected);

  static List<TabIconData> get tabIconsList {
    return [
      TabIconData(Icons.home, true),
      TabIconData(Icons.report, false),
      TabIconData(Icons.settings, false),
    ];
  }
}

class Student_report extends StatefulWidget {
  @override
  _Student_reportState createState() => _Student_reportState();
}

class _Student_reportState extends State<Student_report>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Container(
    color: Colors.white,
  );
  List<DateTime?> _dates = [DateTime.now()];
  bool _showTable = false;

  // Updated dummy data for the table
  List<Map<String, dynamic>> dummyData = [
    {
      "Date and Time": "2024-08-01 12:00",
      "Canteen": "Canteen A",
      "Coupons Used": 120
    },
    {
      "Date and Time": "2024-08-02 14:00",
      "Canteen": "Canteen B",
      "Coupons Used": 90
    },
    // Add more dummy data as needed
  ];

  late List<DataColumn> headers;
  late List<DataRow> rows;

  @override
  void initState() {
    super.initState();

    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[1].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    // Initial tab body for the report page
    tabBody = MyDiaryScreen(animationController: animationController);

    // Initialize headers for the table
    headers = [
      DataColumn(
        label: Center(
          child: Text(
            "Date and Time",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            "Canteen",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: Center(
          child: Text(
            "Coupons Used",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    ];

    // Initialize rows for the table with dummy data
    rows = dummyData.map<DataRow>((data) {
      bool isEven = dummyData.indexOf(data) % 2 == 0;
      return DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return isEven ? Color(0xFFDBE7C9) : Color(0xFFDBE7C9); // Row colors
        }),
        cells: [
          DataCell(
            Center(
              child: Text(
                data["Date and Time"],
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
                maxLines: 2, // Limit to 2 lines
                overflow: TextOverflow.ellipsis, // Handle overflow
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                data["Canteen"],
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                data["Coupons Used"].toString(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void _fetchData() {
    setState(() {
      _showTable = true; // Show the table when the Fetch button is pressed
    });
  }

  void _closeTable() {
    setState(() {
      _showTable = false; // Hide the table when the close button is pressed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Background content
            FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return Positioned(
                    top: 100,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.range,
                            selectedDayHighlightColor: Color(0xFF789461),
                            dayTextStyle: TextStyle(color: Colors.blue),
                            selectedDayTextStyle:
                                TextStyle(color: Colors.white),
                          ),
                          value: _dates,
                          onValueChanged: (dates) {
                            setState(() {
                              _dates = dates;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _fetchData,
                          child: Text(
                            "Fetch",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF789461), // Button color
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            if (_showTable) ...[
              // Blurred background
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              // Table popup
              Positioned(
                top: 150, // Adjust this value to position above the navbar
                left: 20,
                right: 20,
                bottom: 60, // Leave space for the bottom bar
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Results',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: _closeTable,
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 12, // Reduce column spacing
                            columns: headers,
                            rows: rows,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          currentIndex: tabIconsList.indexWhere((tab) => tab.isSelected),
          onTabSelected: (int index) {
            setState(() {
              for (int i = 0; i < tabIconsList.length; i++) {
                tabIconsList[i].isSelected = i == index;
              }
            });

            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                tabBody =
                    Student_report(); // Switch to the report screen itself
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                // Set the tab body to your Settings screen when the Settings tab is clicked.
                // tabBody = SettingsScreen(); // Replace with your Settings screen
              });
            }
          },
        ),
      ],
    );
  }
}
