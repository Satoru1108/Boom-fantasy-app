import 'package:first_app/views/screens/nav_screens/more_games_screen.dart';
import 'package:first_app/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _pageIndex = 0;
  final List<Widget> _pages = [
    // HomeScreen(),
    MoreGamesScreen(),
    // SettingScreen(),
    // UserScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          bottomNavigationBar: BottomNavBar(currentIndex: 0,),
          // BottomNavigationBar(
          //     iconSize: 21,
          //     selectedItemColor: const Color.fromARGB(255, 234, 230, 235),
          //     unselectedItemColor: const Color.fromARGB(255, 173, 211, 174),
          //     currentIndex: _pageIndex,
          //     backgroundColor: ThemeStyle.darkColor,
          //     onTap: (value) {
          //       setState(() {
          //         _pageIndex = value;
          //       });
          //     },
          //     type: BottomNavigationBarType.fixed,
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: SvgPicture.asset(
          //             "assets/icons/home.svg", // Path to your SVG file
          //             width: 24, // Specify width
          //             height: 24, // Specify height
          //           ),
          //           label: "Pick`Em"),
          //       BottomNavigationBarItem(
          //           icon: SvgPicture.asset("assets/icons/stadia_controller.svg",
          //               width: 24, height: 24),
          //           label: "More Games"),
          //       BottomNavigationBarItem(
          //           icon: SvgPicture.asset("assets/icons/military.svg",
          //               width: 24, height: 24),
          //           label: "Entries"),
          //       BottomNavigationBarItem(
          //           icon: SvgPicture.asset("assets/icons/win.svg",
          //               width: 24, height: 24),
          //           label: "Recent Wins"),
          //       BottomNavigationBarItem(
          //           icon: SvgPicture.asset("assets/icons/user_account.svg",
          //               width: 24, height: 24),
          //           label: "More"),
          //     ]),
          body: _pages[_pageIndex]),
    );
  }
}
