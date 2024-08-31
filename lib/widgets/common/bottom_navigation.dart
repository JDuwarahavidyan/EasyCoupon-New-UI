// import 'package:easy_coupon/pages/student_pages/student_report.dart';
// import 'package:flutter/material.dart';
// import 'package:bottom_bar/bottom_bar.dart';

// class BottomBarView extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTabSelected;

//   BottomBarView({
//     required this.currentIndex,
//     required this.onTabSelected,
//     required List<TabIconData> tabIconsList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomBar(
//       selectedIndex: currentIndex,
//       onTap: (index) {
//         onTabSelected(index);
//       },
//       items: const [
//         BottomBarItem(
//           icon: Icon(Icons.home),
//           title: Text('Home'),
//           activeColor: Color(0xFF789461),
//         ),
//         BottomBarItem(
//           icon: Icon(Icons.bar_chart),
//           title: Text('Report'),
//           activeColor: Color(0xFF789461),
//         ),
//         BottomBarItem(
//           icon: Icon(Icons.settings),
//           title: Text('Settings'),
//           activeColor: Color(0xFF789461),
//         ),
//       ],
//     );
//   }
// }



import 'package:easy_coupon/pages/student_pages/student_report.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';

class BottomBarView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  BottomBarView({
    required this.currentIndex,
    required this.onTabSelected, required List tabIconsList,
  });

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      selectedIndex: currentIndex,
      onTap: (index) {
        onTabSelected(index);
      },
      items: const [
        BottomBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Color(0xFF789461),
        ),
        BottomBarItem(
          icon: Icon(Icons.bar_chart),
          title: Text('Report'),
          activeColor: Color(0xFF789461),
        ),
        BottomBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Color(0xFF789461),
        ),
      ],
      backgroundColor: Colors.white, // Set the background color to white
    );
  }
}
