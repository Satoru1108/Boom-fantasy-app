import 'package:first_app/style/style.dart';
import 'package:first_app/views/screens/squadride_screen/squadride_screen.dart';
import 'package:first_app/views/screens/nav_screens/widget/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreGamesScreen extends StatefulWidget {
  const MoreGamesScreen({super.key});

  @override
  State<MoreGamesScreen> createState() => _MoreGamesScreenState();
}

class _MoreGamesScreenState extends State<MoreGamesScreen> {

  late bool _isHovered = false;
  
  // @override
  // void initState () {
  //   super.initState();
  //   _isHovered = false;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeStyle.darkColor,
          title: Text(
            "More Games",
            style: GoogleFonts.getFont("Lato",
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              BannerWidget(),
              SizedBox(
                height: 20,
              ),
              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: GestureDetector(
                  onTap: () {
                    // Handle button tap
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SquadrideScreen();
                    }));
                  },
                  child: Container(
                    width: _isHovered ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width - 30,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _isHovered ? Colors.grey.shade100 : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/squadride.png',
                      width: 100, // Adjust the size as needed
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
