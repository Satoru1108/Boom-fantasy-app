import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  final String playerImage;
  final String name;
  final String oppositePlayer;
  final String time;
  const PlayerCard(
      {super.key,
      required this.playerImage,
      required this.name,
      required this.oppositePlayer,
      required this.time});

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Image.asset(
              widget.playerImage,
              width: 70,
              height: 80,
            ),
            Column(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "vs ${widget.oppositePlayer ?? 'Unknown Player'}",
                  style: TextStyle(
                    fontSize: 24, // Example font size
                    fontWeight: FontWeight.bold, // Example font weight
                    color: Colors.grey.shade200, // Example text color
                  ),
                )
              ],
            )
          ],
        ));
  }
}
