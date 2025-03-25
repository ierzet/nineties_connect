import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/activity/presentation/pages/%20activity_screen.dart';
import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';
import 'package:nineties_connect/features/account/presentation/pages/profile_screen.dart';
import 'package:nineties_connect/features/logout/presentation/pages/logout_dialog.dart';
import 'package:nineties_connect/features/membership/presentation/pages/membership_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const HomeScreen(),
    const MembershipScreen(),
    const ActivityScreen(), // Pastikan ActivityScreen ada di sini
    const ProfileScreen(), // Ganti MyAccountScreen dengan ProfileScreen
  ];

  void _onItemTapped(int index) {
    setState(() {   
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color(0xFF9D8600)
              ], // Black to gold gradient
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/svgs/nineties-app-logo.svg',
            height: 39,
            width: 102,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white, size: 30), 
            onPressed: () {
              LogoutDialog.show(context);
            },
          ),
        ],
      ),

      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Container(
        width: 375,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            backgroundColor: Color(0xFFFFDD00),
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavBarItem(Icons.home, 'Home', 0),
              _buildNavBarItem(Icons.search, 'Membership', 1),
              _buildNavBarItem(Icons.local_activity, 'Activity', 2), // Ubah ikon untuk Activity
              _buildNavBarItem(Icons.person, 'My Account', 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (_selectedIndex == index) // Show indicator if selected
            Positioned(
              top: 0,
              child: Container(
                width: 37,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0), // Adjust icon position
            child: Icon(icon),
          ),
        ],
      ),
      label: label,
    );
  }
}

