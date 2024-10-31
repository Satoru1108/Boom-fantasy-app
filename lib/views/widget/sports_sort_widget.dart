import 'package:first_app/style/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SportsNavigation(),
    );
  }
}

class SportsNavigation extends StatefulWidget {
  const SportsNavigation({super.key});

  @override
  State<SportsNavigation> createState() => _SportsNavigationState();
}

class _SportsNavigationState extends State<SportsNavigation> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.sports_basketball, 'label': 'NBA'},
    {'icon': Icons.sports_basketball_outlined, 'label': 'NBAQ1'},
    {'icon': Icons.sports_football, 'label': 'NFL'},
    {'icon': Icons.sports_baseball, 'label': 'MLB'},
    {'icon': Icons.sports_esports, 'label': 'CS2'},
    {'icon': Icons.emoji_events, 'label': 'CFB'},
    {'icon': Icons.emoji_events, 'label': 'CFB'},
    {'icon': Icons.emoji_events, 'label': 'CFB'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: ThemeStyle.darkColor,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navItems.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _navItems[index]['icon'],
                      color: _selectedIndex == index
                          ? const Color(0xFF3498db)
                          : Colors.grey,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _navItems[index]['label'],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? const Color(0xFF3498db)
                            : Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}