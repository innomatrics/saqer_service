import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20home%20screen/driver_home_screen.dart';
import 'package:saqer_services/screens/driver/screens/driver%20notifications/driver_notifications_page.dart';
import 'package:saqer_services/screens/driver/screens/driver%20profile/driver_profile_page.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/view/driver_wallet_screen.dart';

class DriverBottomNavBar extends StatefulWidget {
  const DriverBottomNavBar({super.key});

  @override
  State<DriverBottomNavBar> createState() => _DriverBottomNavBarState();
}

class _DriverBottomNavBarState extends State<DriverBottomNavBar> {
  int _currentIndex = 0;
  List<IconData> bottomBarIcons = [
    Icons.home,
    Icons.wallet,
    Icons.notifications,
    Icons.person,
  ];
  List<Widget> pages = [
    const DriverHomeScreen(),
    const DriverWalletScreen(),
    const DriverNotificationsPage(),
    const DriverProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.bottomNavBarColor,
        color: AppColors.scaffoldBackgroundColor,
        index: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(
          bottomBarIcons.length,
          (index) => Icon(bottomBarIcons[index]),
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: pages),
    );
  }
}
