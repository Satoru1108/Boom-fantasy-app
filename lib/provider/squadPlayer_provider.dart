import 'package:first_app/models/squadPlayer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final squadplayerProvider =
    StateNotifierProvider<SquadPlayerNotifier, Map<String, SquadplayerModel>>(
  (ref) => SquadPlayerNotifier(),
);

class SquadPlayerNotifier extends StateNotifier<Map<String, SquadplayerModel>> {
  SquadPlayerNotifier() : super({});

  void addSquadPlayer({
    required String playerImage,
    required String playerName,
    required String oppositePlayer,
    required String date,
    required String playerId,
    required Color color,
  }) {
    if (state.containsKey(playerId)) {
      state = {
        ...state,
        playerId: SquadplayerModel(
            playerId: playerId,
            playerImage: state[playerId]!.playerImage,
            playerName: state[playerId]!.playerName,
            oppositePlayer: state[playerId]!.oppositePlayer,
            date: state[playerId]!.date,
            color: state[playerId]!.color)
      };
    } else {
      state = {
        ...state,
        playerId: SquadplayerModel(
            playerId: playerId,
            playerImage: playerImage,
            playerName: playerImage,
            oppositePlayer: oppositePlayer,
            date: date,
            color: color)
      };
    }
  }

  Map<String, SquadplayerModel> get getItem => state;

  void clearSquadPlayer () {
    state.clear();

    state = {...state};
  }

  void removePlayer(String playerId) {
    state.remove(playerId);

    state = {...state};
  }


}

