import 'package:first_app/provider/squadPlayer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerCard extends ConsumerStatefulWidget {
  final String playerImage;
  final String name;
  final String oppositePlayer;
  final String date;
  final Color color;
  final String playerId;
  const PlayerCard({
    super.key,
    required this.playerId,
    required this.playerImage,
    required this.name,
    required this.oppositePlayer,
    required this.date,
    required this.color,
  });

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends ConsumerState<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    final squadPlayerList = ref.watch(squadplayerProvider).values.toList();
    late bool isSelected = false;

    void checkSelected() {
        for (var item in squadPlayerList) {
          if (item.playerId == widget.playerId) {
            isSelected = true;
          }
        }
    }
    checkSelected();
    return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.blue.withOpacity(0.5)
                    : const Color.fromARGB(255, 4, 14, 22)
                        .withOpacity(0.5), // Blue color with opacity
                spreadRadius: 5, // Spread radius
                blurRadius: 15, // Blur radius
                offset: Offset(0, 3), // Offset of the shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  widget.playerImage,
                  width: 100,
                  height: 100,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "vs ${widget.oppositePlayer} -${widget.date}",
                        style: TextStyle(
                          fontSize: 14, // Example font size
                          fontWeight: FontWeight.bold, // Example font weight
                          color: Colors.grey.shade200, // Example text color
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isSelected ? Icon(Icons.check, size: 30, color: Colors.white, weight: 40,) : SizedBox()
            ],
          ),
        ));
  }
}
