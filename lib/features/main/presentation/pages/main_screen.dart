import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';

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
    const ActivityScreen(),
    const MyAccountScreen(),
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
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // TODO: Navigate to settings page
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => context.go('/auth'),
          ),
        ],
      ),

      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: ClipRRect(
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
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.card_membership),
            //   label: 'Membership',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.local_activity),
            //   label: 'Activity',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'My Account',
            // ),
            _buildNavBarItem(Icons.home, 'Home', 0),
            _buildNavBarItem(Icons.search, 'Membership', 1),
            _buildNavBarItem(Icons.person, 'Activity', 2),
            _buildNavBarItem(Icons.home, 'My Account', 3),
          ],
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
              //bottom: 0,
              child: Container(
                width: 34,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
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

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Membership Screen', style: TextStyle(fontSize: 20)));
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Activity Screen', style: TextStyle(fontSize: 20)));
  }
}

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('My Account Screen', style: TextStyle(fontSize: 20)));
  }
}
