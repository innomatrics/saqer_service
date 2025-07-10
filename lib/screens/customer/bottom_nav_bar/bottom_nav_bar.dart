import 'package:flutter/material.dart';
import 'package:saqer_services/screens/customer/add%20car/add_car_screen.dart';
import 'package:saqer_services/screens/customer/home_screen/home_screen.dart';
import 'package:saqer_services/screens/customer/profile%20screen/profile_screen.dart';
import 'package:saqer_services/screens/customer/reward%20screen/reward_screen.dart';
import 'package:saqer_services/screens/customer/trip%20screen/trip_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<IconData> icons = [
    Icons.home,
    Icons.directions_car,
    Icons.card_giftcard,
    Icons.explore,
    Icons.account_circle,
  ];
  List<String> labels = ["Home", "Cars", "Rewards", "Trips", "Profile"];
  int _selectedIndex = 0;

  // Screens corresponding to each navigation item
  final List<Widget> _screens = [
    const HomeContent(),
    const AddCarScreen(),
    const RewardsScreen(),
    const TripsScreen(),
    const ProfileScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          labels.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(icons[index]),
            label: labels[index],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
