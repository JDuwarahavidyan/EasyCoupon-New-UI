// import 'package:flutter/cupertino.dart'; // Import Cupertino icons
// import 'package:flutter/material.dart';
// import 'package:easy_coupon/widgets/widgets.dart';

// class Forget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Background(
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               top: size.height * 0.05,  // Adjusted as necessary
//               left: 20,  // Adjusted as necessary
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context); // Navigate back to the previous screen
//                 },
//                 child: Icon(
//                   CupertinoIcons.back, // Cupertino back icon
//                   size: 30, // Adjust size as needed
//                   color: Color(0xFF294B29), // Adjust color as needed
//                 ),
//               ),
//             ),
//             Positioned(
//               top: size.height * 0.1,    // Move the image slightly below the top
//               right: -20,   // Move the image further to the right
//               child: Container(
//                 width: size.width * 0.6, // Adjust width as needed
//                 child: Image.asset(
//                   "assets/images/landing/pw.png",
//                   fit: BoxFit.contain, // Maintain aspect ratio
//                 ),
//               ),
//             ),
//             Positioned(
//               top: size.height * 0.40,   // Move the text upwards
//               left: 40,  // Align text to the left
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "ENTER YOUR EMAIL TO\nRESET YOUR PASSWORD",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF294B29),
//                     fontSize: 25,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: size.height * 0.5,  // Adjust position to place below the title
//               left: 40,
//               right: 40,
//               child: Column(
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "Enter the Email",  // Corrected typo
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.05),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(80.0),
//                       ),
//                       padding: EdgeInsets.zero,
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 50.0,
//                       width: size.width * 0.5,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(80.0),
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xFF294B29),
//                             Color(0xFF50623A),
//                           ],
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(0),
//                       child: Text(
//                         "SEND EMAIL",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_coupon/widgets/widgets.dart';

class PasswordEmailResetPage extends StatelessWidget {
    const PasswordEmailResetPage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,  // Prevents background from moving when keyboard appears
      body: Background(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: size.height * 0.05,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.back,
                  size: 30,
                  color: Color(0xFF294B29),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              right: -20,
              child: Container(
                width: size.width * 0.6,
                child: Image.asset(
                  "assets/images/landing/pw.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.40,
              left: 40,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ENTER YOUR EMAIL TO\nRESET YOUR PASSWORD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF294B29),
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.5,
              left: 40,
              right: 40,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Enter the Email",
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      padding: EdgeInsets.zero,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF294B29),
                            Color(0xFF50623A),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "SEND EMAIL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
