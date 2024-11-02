import 'package:first_app/provider/squadPlayer_provider.dart';
import 'package:first_app/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewEntryScreen extends ConsumerStatefulWidget {
  const ReviewEntryScreen({super.key});

  @override
  _ReviewEntryScreenState createState() => _ReviewEntryScreenState();
}

class _ReviewEntryScreenState extends ConsumerState<ReviewEntryScreen> {
  final List entryList = [1, 5, 10, 20, "OTHER"];
  @override
  Widget build(BuildContext context) {
    final squadPlayerProvider = ref.read(squadplayerProvider.notifier);
    final squadPlayerList = ref.watch(squadplayerProvider);
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: ThemeStyle.darkColor),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: ThemeStyle.secondDarkColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                      )),
                     

                    Text(
                      "Review Entry",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 90, 171, 238),
                          ),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 129, 191, 241),
                              blurRadius: 5,
                            )
                          ]),
                      child: squadPlayerList.values.toList().length > index
                          ? Stack(
                              children: [
                                Image.asset(
                                  squadPlayerList.values
                                      .toList()[index]
                                      .playerImage,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    right: -20,
                                    top: -20,
                                    child: IconButton(
                                        onPressed: () {
                                          squadPlayerProvider.removePlayer(
                                              squadPlayerList.values
                                                  .toList()[0]
                                                  .playerId);
                                        },
                                        color: Colors.white,
                                        padding: EdgeInsets.all(16),
                                        splashRadius: 30,
                                        icon: Icon(
                                            Icons.cancel_presentation_sharp)))
                              ],
                            )
                          : SizedBox());
                })),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ThemeStyle.secondDarkColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 5),
                      child: Text(
                        "ENTRY AMOUNT",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "(\$100 MAX)",
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ),
                    Icon(
                      Icons.info,
                      size: 20,
                      color: Colors.white,
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$--",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(entryList.length, (index) {
                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              backgroundColor: Colors.grey.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: Text(
                            "\$${entryList[index]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                    ),
                  ),
                  
                  Center(
                    child: Text(
                      "PAYOUTS:",
                      style: GoogleFonts.getFont("Lato", fontSize: 17, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "192-280 rec yds",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17, decoration: TextDecoration.none,),

                                  
                              ),
                              Text(
                                "2x",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 17),
                              ),
                              Text(
                                "\$--",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 25, 241, 79),
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "281-311 rec yds",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "5x",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$--",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 25, 241, 79),
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "192-280 rec yds",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Text(
                                "2x",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 17),
                              ),
                              Text(
                                "\$--",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 25, 241, 79),
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ReviewEntryScreen();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 30),
                            backgroundColor: Colors.blue, // Background color
                            foregroundColor: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12), // Padding
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(0), // Rounded corners
                            ),
                            elevation: 5, // Shadow effect
                          ),
                          
                          child: Text(
                            'ENTER AMOUNT',
                            style: TextStyle(fontSize: 18), // Text size
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      )
    ]);
  }
}
