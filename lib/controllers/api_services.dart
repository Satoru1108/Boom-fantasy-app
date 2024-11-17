import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com';
  final String apiKey = 'b75de89458mshab355150405c62ap1d2f45jsn033e8a00ec6c';

  Future<Map<String, dynamic>> getNFLGamesForPlayer(String playerID) async {
    final url = Uri.parse('$baseUrl/getNFLGamesForPlayer?playerID=$playerID&fantasyPoints=true&twoPointConversions=2&passYards=.04&passTD=4&passInterceptions=-2&pointsPerReception=1&carries=.2&rushYards=.1&rushTD=6&fumbles=-2&receivingYards=.1&receivingTD=6&targets=0&defTD=6&xpMade=1&xpMissed=-1&fgMade=3&fgMissed=-3');

    final response = await http.get(
      url,
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load NFL games for player');
    }
  }

  Future<Map<String, dynamic>> getNFLTeams() async {
    final url = Uri.parse('GET /getNFLTeams?sortBy=standings&rosters=false&schedules=false&topPerformers=true&teamStats=true&teamStatsSeason=2023');

     final response = await http.get(
      url,
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tank01-nfl-live-in-game-real-time-statistics-nfl.p.rapidapi.com',
      },
    );

    if(response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load NFL teams");
    }

  }

  
}
