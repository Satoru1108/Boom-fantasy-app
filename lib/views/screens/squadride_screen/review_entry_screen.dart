import 'package:first_app/provider/squadPlayer_provider.dart';
import 'package:first_app/style/style.dart';
import 'package:first_app/utils/app_routes.dart';
import 'package:first_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewEntryScreen extends ConsumerStatefulWidget {
  const ReviewEntryScreen({super.key});

  @override
  _ReviewEntryScreenState createState() => _ReviewEntryScreenState();
}

class _ReviewEntryScreenState extends ConsumerState<ReviewEntryScreen> {
  final List entryList = [1, 5, 10, 20, "OTHER"];
  int selectedEntry = -1;
  void gotoSquadRide () {
    Navigator.pushNamed(context, AppRoutes.squadride);
  }
  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Insufficient Funds',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'You don\'t have enough funds to play. Either change your entry amount or deposit additional funds to play.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.grey[600],
                        ),
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          'DEPOSIT FUNDS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              height: 56, // Standard height similar to AppBar
              color: Colors.grey[700],
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(
                children: [
                  // Close button
                  Positioned(
                    left: 4,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                        weight: 25,
                      ),
                      onPressed: () {
                        gotoSquadRide();
                      },
                    ),
                  ),
                  // Centered title
                  Center(
                    child: Text(
                      'Review Entry',
                      style: AppStyles.textStyle_25_500w
                    ),
                  ),
                ],
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
                                          gotoSquadRide();
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
                        style: AppStyles.textStyle_16_500w,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "(\$100 MAX)",
                        style: AppStyles.textStyle_16_500w,
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
                    style: AppStyles.textStyle_35_500w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(entryList.length, (index) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedEntry = index;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              backgroundColor: selectedEntry == index ? AppStyles.hoverColor : Colors.grey.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: Text(
                            "\$${entryList[index]}",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Center(
                    child: Text(
                      "PAYOUTS:",
                      style: AppStyles.textStyle_16_500w,
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
                                style: AppStyles.textStyle_16_500w,
                              ),
                              Text(
                                "2x",
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 17,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                selectedEntry >= 0 ? "\$${entryList[selectedEntry] * 2}" : "\$--",
                                style: AppStyles.textStyle_16_500g,
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
                                style: AppStyles.textStyle_16_500w,
                              ),
                              Text(
                                "5x",
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                selectedEntry >= 0 ? "\$${entryList[selectedEntry] * 5}" : "\$--",
                                style: AppStyles.textStyle_16_500g,
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
                                style: AppStyles.textStyle_16_500w,
                              ),
                              Text(
                                "20x",
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 17,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                selectedEntry >= 0 ? "\$${entryList[selectedEntry] * 20}" : "\$--",
                                style: AppStyles.textStyle_16_500g,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showModal(context);
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
