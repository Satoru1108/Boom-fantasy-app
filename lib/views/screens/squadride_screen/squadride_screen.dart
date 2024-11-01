import 'package:first_app/provider/squadPlayer_provider.dart';
import 'package:first_app/style/style.dart';
import 'package:first_app/views/screens/nav_screens/more_games_screen.dart';
import 'package:first_app/views/screens/squadride_screen/widget/playerCard.dart';
import 'package:first_app/views/widget/filter_button.dart';
import 'package:first_app/views/widget/sports_sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SquadrideScreen extends ConsumerStatefulWidget {
  const SquadrideScreen({super.key});

  @override
  _SquadrideScreenState createState() => _SquadrideScreenState();
}

class _SquadrideScreenState extends ConsumerState<SquadrideScreen> {
  final List<String> _filter_list = [
    "Receiving Yard",
    "Rushing Yard",
    "Passing Yard",
  ];
  int selectedFilter = 0;

  final List<FilterItem> _team_list = [
    FilterItem(title: "HOU @ NYJ", count: 6),
    FilterItem(title: "LV @ CIN", count: 2),
    FilterItem(title: "DAL @ ATL", count: 5),
    FilterItem(title: "HTD @ DHE", count: 3),
  ];
  int selectedTeam = 0;

  final List<PlayerCardItem> _playercardList = [
    PlayerCardItem(
        playerId: "00",
        playerImage: "assets/images/player1.png",
        name: "Davante Adams",
        oppositePlayer: "HOU",
        date: "Fri 9:15 AM",
        color: Colors.purple),
    PlayerCardItem(
        playerId: "01",
        playerImage: "assets/images/player2.png",
        name: "Davante Adams",
        oppositePlayer: "HOU",
        date: "Fri 9:15 AM",
        color: Colors.lightBlue),
    PlayerCardItem(
        playerId: "02",
        playerImage: "assets/images/player1.png",
        name: "Davante Adams",
        oppositePlayer: "HOU",
        date: "Fri 9:15 AM",
        color: Colors.green),
    PlayerCardItem(
        playerId: "03",
        playerImage: "assets/images/player2.png",
        name: "Davante Adams",
        oppositePlayer: "HOU",
        date: "Fri 9:15 AM",
        color: Colors.lightBlue),
    PlayerCardItem(
        playerId: "04",
        playerImage: "assets/images/player1.png",
        name: "Davante Adams",
        oppositePlayer: "HOU",
        date: "Fri 9:15 AM",
        color: Colors.green)
  ];
  int selectedPlayer = 0;

  @override
  Widget build(BuildContext context) {
    final squadPlayerProvider = ref.read(squadplayerProvider.notifier);
    final squadPlayerList = ref.watch(squadplayerProvider);
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ThemeStyle.darkColor,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MoreGamesScreen();
                            }));
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                            color: Colors.white,
                          )),
                      Text("SQUAD RIDE",
                          style: GoogleFonts.getFont("Lato",
                              fontSize: 24, color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            size: 30,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SportsNavigation(),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        _filter_list.length,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedFilter = index;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: selectedFilter == index
                                      ? FilterButton(
                                          title: _filter_list[index],
                                          isActive: true)
                                      : FilterButton(
                                          title: _filter_list[index])),
                            )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Draft a roster of 3 plyers that will combine to catch the most yards. The higher the total, the more you win.",
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.grey.shade300,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                _team_list.length,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTeam = index;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: selectedTeam == index
                                            ? FilterButton(
                                                title: _team_list[index].title,
                                                count: _team_list[index].count,
                                                isActive: true,
                                              )
                                            : FilterButton(
                                                title: _team_list[index].title,
                                                count: _team_list[index].count),
                                      ),
                                    )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                            _playercardList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPlayer = index;
                                    squadPlayerProvider.addSquadPlayer(
                                        playerImage:
                                            _playercardList[index].playerImage,
                                        playerName: _playercardList[index].name,
                                        oppositePlayer: _playercardList[index]
                                            .oppositePlayer,
                                        date: _playercardList[index].date,
                                        playerId:
                                            _playercardList[index].playerId,
                                        color: _playercardList[index].color);

                                    print(squadPlayerList.values);
                                  });
                                },
                                child: PlayerCard(
                                  playerId: _playercardList[index].playerId,
                                  playerImage:
                                      _playercardList[index].playerImage,
                                  name: _playercardList[index].name,
                                  oppositePlayer:
                                      _playercardList[index].oppositePlayer,
                                  date: _playercardList[index].date,
                                  color: _playercardList[index].color,
                                ),
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
        Visibility(
          visible: squadPlayerList.values.isNotEmpty,
          child: Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(10)),
                  color: const Color.fromARGB(255, 73, 71, 71)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            "Your REC YDS SQUAD:",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade200),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            squadPlayerProvider.clearSquadPlayer();
                          },
                          mouseCursor: SystemMouseCursors.click,
                          hoverColor: Colors.white,
                          child: Text(
                            "CLEAR ALL",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade100,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) {
                        return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 90, 171, 238),
                                ),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 129, 191, 241),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: squadPlayerList.values.toList().length >
                                    index
                                ? Stack(
                                    children: [
                                      Image.asset(squadPlayerList.values
                                          .toList()[index]
                                          .playerImage),
                                      Positioned(
                                          right: -20,
                                          top: -20,
                                          child: IconButton(
                                              onPressed: () {
                                                squadPlayerProvider
                                                    .removePlayer(
                                                        squadPlayerList.values
                                                            .toList()[0]
                                                            .playerId);
                                              },
                                              color: Colors.white,
                                              padding: EdgeInsets.all(16),
                                              splashRadius: 30,
                                              icon: Icon(Icons
                                                  .cancel_presentation_sharp)))
                                    ],
                                  )
                                : SizedBox());
                      })),
                  squadPlayerList.values.toList().length > 2 ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "192-280 rec yds:  2x",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "281-311 rec yds:  5x",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "312+ rec yds:  20x",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ) : SizedBox(),
                  squadPlayerList.values.toList().length > 2 ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your action here
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 30),
                        backgroundColor: Colors.blue, // Background color
                        foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        elevation: 5, // Shadow effect
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18), // Text size
                      ),
                    ),
                  ): SizedBox()
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class FilterItem {
  final String title;
  final int count;
  const FilterItem({required this.title, required this.count});
}

class PlayerCardItem {
  final String playerId;
  final String playerImage;
  final String name;
  final String oppositePlayer;
  final String date;
  final Color color;
  const PlayerCardItem(
      {required this.playerId,
      required this.playerImage,
      required this.name,
      required this.oppositePlayer,
      required this.date,
      required this.color});
}
