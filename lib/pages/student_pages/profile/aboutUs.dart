import 'package:easy_coupon/pages/pages.dart';
import 'package:easy_coupon/widgets/common/background.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class AboutUs extends StatefulWidget {
  final String userRole;
  const AboutUs({super.key, required this.userRole});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Ensure transparency to see the background
        appBar: AppBar(
          backgroundColor: const Color(0xFFDBE7C9),
          leading: IconButton(
            onPressed: () {
              if (widget.userRole == 'student') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentMainPage(
                      currentIndex: 2,
                    ),
                  ),
                );
              } else if (widget.userRole == 'canteen') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CanteenAMainPage(
                      currentIndex: 2,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: const Text(
            "About Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF294B29),
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0), // Default padding
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Lottie.asset(
                              'assets/images/landing/salad.json',
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Easy Coupon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF294B29),
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        "Fast and Easy",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text(
                        "Easy Coupon Version 1.0.2\n\n"
                        "Developed by Team TDDS, a group of undergraduates from the 22nd batch of the Faculty of Engineering, University of Ruhuna, Easy Coupon is just the beginning. We are committed to continually enhancing the app and releasing improved versions in the future to better serve our users.\n\n"
                        "Easy Coupon is designed to simplify and streamline the process of issuing and redeeming food coupons for students. With a user-friendly interface and quick access to essential features, this app ensures that students can easily manage their meal plans without any hassle.\n\n"
                        "Our goal is to make the coupon management system more efficient and accessible for everyone involved, providing a seamless experience from start to finish. Whether you're a student looking to redeem a coupon or an administrator managing the system, Easy Coupon offers the tools you need to get the job done effectively.\n\n"
                        "We would like to express our heartfelt gratitude to our advisor, Dr. Kushan Sudheera, for giving us this opportunity and for his invaluable guidance throughout the project.\n\n"
                        "Thank you for choosing Easy Coupon!\n\n"
                        "Duwarahavidyan Jeganathan\nSachinthana Fernando\nDeshan Dissanayake\nTharuka Harshajith",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify, // Justify text alignment
                      ),
                    ],
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
