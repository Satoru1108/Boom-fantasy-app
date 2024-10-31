import 'dart:ffi';

import 'package:first_app/style/style.dart';
import 'package:first_app/views/widget/filter_button.dart';
import 'package:first_app/views/widget/sports_sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SquadrideScreen extends StatefulWidget {
  const SquadrideScreen({super.key});

  @override
  State<SquadrideScreen> createState() => _SquadrideScreenState();
}

class _SquadrideScreenState extends State<SquadrideScreen> {
  final List<String> _filter_list = [
    "Receiving Yard",
    "Rushing Yard",
    "Passing Yard",
  ];

  final List<FilterItem> _team_list = [
    FilterItem(title: "HOU @ NYJ", count : 6),
    FilterItem(title: "LV @ CIN", count : 2),
    FilterItem(title: "DAL @ ATL", count : 5),
    FilterItem(title: "HTD @ DHE", count : 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
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
                        onPressed: () {},
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
                            child: Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: FilterButton(
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
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey.shade300,)            
                        ),
                                    
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

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FilterButton(title: _team_list[index].title, count: _team_list[index].count ),
                                ),
                              )
                            ),
                          ),
                        ),
                      
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Container(),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}


class FilterItem {
  final String title;
  final int count;
  const FilterItem({required this.title, required this.count});
}