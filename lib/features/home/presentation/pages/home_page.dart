import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper function for creating icons with text
    Widget featureItem(IconData icon, String label) {
      return Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 28,
            child: Icon(icon, color: Colors.black, size: 28),
          ),
          SizedBox(height: 8), // Consistent spacing
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24), // Maintain a consistent spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 53,
              decoration: BoxDecoration(
                color: Color(0xFFFFDD00),
                borderRadius: BorderRadius.circular(26),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Avatar
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/car.png'),
                    radius: 18,
                  ),
                  // Username Text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Muhammad Fakhri Junaidi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Not Verified (Check your email)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  // Bell Icon Avatar
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 18,
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Title "Your Membership"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Your Membership',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12), // Adjust spacing for consistency
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // Smooth rounded corners
              child: Image.asset(
                'assets/images/car.png', // Replace with actual image
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16), // Added consistency
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '90s Experience',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24), // Removed negative radius
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      featureItem(Icons.place, 'Outlet Location'),
                      featureItem(Icons.shopping_bag, 'Marketplace'),
                      featureItem(Icons.touch_app, 'Booking Service'),
                    ],
                  ),
                  SizedBox(height: 24), // Increased spacing for balance
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Image.asset(
                      'assets/images/banner-ads.png', // Change to actual image path
                      width: 317,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // Dots Indicator with correct styling
                  DotsIndicator(
                    dotsCount: 3, // Adjust based on the number of images
                    position:
                        0, // Make sure to update dynamically based on user swipes
                    decorator: DotsDecorator(
                      color: Color(0xFFA0A0A0), // Inactive dots
                      activeColor: Colors.black, // Active dot fully black
                      size: Size.square(9),
                      activeSize: Size.square(9),
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2)),
                    ),
                  ),
                  SizedBox(height: 16), // Consistency in spacing
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
