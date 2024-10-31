

import 'package:flutter/material.dart';

class PlayerStatsCard extends StatelessWidget {
  final List<StatItem> stats;     
  const PlayerStatsCard({super.key, required this.stats});
  
  


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFDC2626),
              // borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                // Player Image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/player1.png'), // Replace with actual image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Player Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cade Cunningham',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '@ PHI - Thu 8:07 AM',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Stats Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: stats.map((stat) => StatRow(stat)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final StatItem stat;

  const StatRow(this.stat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Stat Icon and Label
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.swap_vert,
                      size: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${stat.value} ${stat.label}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          // Multipliers
          Row(
            children: [
              _buildMultiplier(stat.upMultiplier, true),
              const SizedBox(width: 8),
              _buildMultiplier(stat.downMultiplier, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMultiplier(String value, bool isUp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF27272A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            isUp ? Icons.arrow_upward : Icons.arrow_downward,
            size: 14,
            color: Colors.white.withOpacity(0.8),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class StatItem {
  final String label;
  final String value;
  final String upMultiplier;
  final String downMultiplier;

  StatItem(this.label, this.value, this.upMultiplier, this.downMultiplier);
}

// // Usage Example
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: PlayerStatsCard(),
//           ),
//         ),
//       ),
//     );
//   }
// }