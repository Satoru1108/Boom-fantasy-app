
import 'package:first_app/style/style.dart';
import 'package:first_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 2,
          color: Colors.black,
        ),
        BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? ThemeStyle.littleBlackColor
                      : Colors.white, // Background color for the container
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(width: 2, color: ThemeStyle.littleBlackColor),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeStyle
                          .littleBlackColor, // Adjust opacity if needed
                      offset: const Offset(2, 2),
                      // blurRadius: 4, // Add blur radius for a smoother shadow
                    ),
                  ], // Rounded corners
                ),

                child: _selectedIndex == 0
                    ? Image.asset('assets/icons/home.svg')
                    : Image.asset(
                        'assets/icons/home.svg'), // Icon inside the container
              ),
              label: 'Pick`Em',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? ThemeStyle.littleBlackColor
                      : Colors.white, // Background color for the container
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(width: 2, color: ThemeStyle.littleBlackColor),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeStyle
                          .littleBlackColor, // Adjust opacity if needed
                      offset: const Offset(2, 2),
                      // blurRadius: 4, // Add blur radius for a smoother shadow
                    ),
                  ], // Rounded corners
                ),

                child: _selectedIndex == 1
                    ? Image.asset('assets/icons/stadia_controller.svg')
                    : Image.asset(
                        'assets/icons/stadia_controller.svg'), // Icon inside the container
              ),
              label: 'More Games',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  color:
                      ThemeStyle.mainColor, // Background color for the container
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(width: 2, color: ThemeStyle.littleBlackColor),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeStyle
                          .littleBlackColor, // Adjust opacity if needed
                      offset: const Offset(2, 2),
                      // blurRadius: 4, // Add blur radius for a smoother shadow
                    ),
                  ], // Rounded corners
                ),

                child: Image.asset(
                    'assets/icons/military.svg'), // Icon inside the container
              ),
              label: 'Entries',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  color: _selectedIndex == 3
                      ? ThemeStyle.littleBlackColor
                      : Colors.white, // Background color for the container
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(width: 2, color: ThemeStyle.littleBlackColor),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeStyle
                          .littleBlackColor, // Adjust opacity if needed
                      offset: const Offset(2, 2),
                      // blurRadius: 4, // Add blur radius for a smoother shadow
                    ),
                  ], // Rounded corners
                ),

                child: _selectedIndex == 3
                    ? Image.asset('assets/icons/win.svg')
                    : Image.asset(
                        'assets/icons/win.svg'), // Icon inside the container
              ),
              label: 'Recent Wins',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  color: _selectedIndex == 4
                      ? ThemeStyle.littleBlackColor
                      : Colors.white, // Background color for the container
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(width: 2, color: ThemeStyle.littleBlackColor),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeStyle
                          .littleBlackColor, // Adjust opacity if needed
                      offset: const Offset(2, 2),
                      // blurRadius: 4, // Add blur radius for a smoother shadow
                    ),
                  ], // Rounded corners
                ),
                child: Image.asset('assets/icons/user_account.svg'),
                 // Icon inside the container
              ),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: _onItemTapped,
        ),
      ],
    );
  }
}
