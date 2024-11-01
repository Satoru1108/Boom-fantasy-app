import 'package:flutter/material.dart';

class SquadplayerModel {
  final String playerId;
  final String playerImage;
  final String playerName;
  final String oppositePlayer;
  final String date;
  final Color color;

  SquadplayerModel({
      required this.playerId,
      required this.playerImage,
      required this.playerName,
      required this.oppositePlayer,
      required this.color,
      required this.date
    });
}
