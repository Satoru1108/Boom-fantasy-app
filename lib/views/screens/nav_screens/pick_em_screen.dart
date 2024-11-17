import 'package:first_app/views/screens/nav_screens/widget/header_widget.dart';
import 'package:first_app/views/screens/nav_screens/widget/player_stats_card_widget.dart';
import 'package:first_app/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class PickEmScreen extends StatefulWidget {
  const PickEmScreen({super.key});

  @override
  State<PickEmScreen> createState() => _PickEmScreenState();
}

class _PickEmScreenState extends State<PickEmScreen> {
  final List<StatItem> stats = [
    StatItem("Points", "24.5", "1.82x", "1.73x"),
    StatItem("Rebounds", "4.5", "1.58x", "2.03x"),
    StatItem("Assists", "7.5", "1.95x", "1.63x"),
    StatItem("3-Pointers", "1.5", "1.52x", "2.13x"),
    StatItem("Pts + Rebs + Asts", "36.5", "1.76x", "1.79x"),
    StatItem("Pts + Rebs", "29.5", "1.76x", "1.77x"),
    StatItem("Pts + Asts", "31.5", "1.8x", "1.76x"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              PlayerStatsCard(stats : stats),
              PlayerStatsCard(stats : stats)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}