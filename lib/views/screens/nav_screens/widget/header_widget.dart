import 'package:first_app/style/style.dart';
import 'package:first_app/views/widgets/sports_sort_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.21,
      child: Stack(
        children: [
          // Image.asset(
          //   "assets/images/header1.jpg",
          //   width: MediaQuery.of(context).size.width,
          //   fit: BoxFit.cover,
          // ),
          Positioned(
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              child: Column(

                children: [ 
                  Container(
                    color: ThemeStyle.darkColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SafeArea(
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Info Icon
                          IconButton(
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              // Add info button functionality
                            },
                          ),
                  
                          // Center Logo
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.asset(
                              'assets/icons/logo.png', // Replace with your actual logo asset
                              height: 24,
                              color: Colors.white,

                            ),
                          ),
                  
                          // Balance and Deposit Section
                          Column(
                            children: [
                              Text(
                                'BALANCE: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\$0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () {
                                  // Add deposit functionality
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'DEPOSIT',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: SportsNavigation())
                ]
              ))
        ],
      ),
    );
  }
}
