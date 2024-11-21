import 'package:first_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // Initialize _selectedIndex with the currentIndex passed from the widget
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.pickem);
      case 1:
        Navigator.pushNamed(context, AppRoutes.moreGame);
      case 2:
        Navigator.pushNamed(context, AppRoutes.entries);
      case 3:
        Navigator.pushNamed(context, AppRoutes.recentWins);
      case 4:
        Navigator.pushNamed(context, AppRoutes.more);

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 21,
        selectedItemColor: const Color.fromARGB(255, 29, 29, 29),
        unselectedItemColor: const Color.fromARGB(255, 59, 59, 59),
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/icons/home.svg', width: 24, height: 24,)
                : SvgPicture.asset(
                    'assets/icons/home.svg', width: 24, height: 24,), // Icon inside the container
      
            label: 'Pick`Em',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/icons/stadia_controller.svg', width: 24, height: 24)
                : SvgPicture.asset(
                    'assets/icons/stadia_controller.svg', width: 24, height: 24), // Icon inside the container
            label: 'More Games',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/icons/military.svg', width: 24, height: 24), // Icon inside the container
            label: 'Entries',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/icons/win.svg', width: 24, height: 24)
                : SvgPicture.asset(
                    'assets/icons/win.svg', width: 24, height: 24), // Icon inside the container
            label: 'Recent Wins',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/icons/user_account.svg', width: 24, height: 24)
                : SvgPicture.asset("assets/icons/user_account.svg", width: 24, height: 24),
            // Icon inside the container
            label: 'More',
          ),
        ],
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
