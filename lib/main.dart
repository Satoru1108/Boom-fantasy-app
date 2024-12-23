import 'dart:io';
import 'package:first_app/utils/app_routes.dart';
import 'package:first_app/views/screens/authontication_screens/signin.dart';
import 'package:first_app/views/screens/nav_screens/entries_screen.dart';
import 'package:first_app/views/screens/nav_screens/more_games_screen.dart';
import 'package:first_app/views/screens/nav_screens/more_screen.dart';
import 'package:first_app/views/screens/nav_screens/pick_em_screen.dart';
import 'package:first_app/views/screens/nav_screens/recentwin_screen.dart';
import 'package:first_app/views/screens/squadride_screen/review_entry_screen.dart';
import 'package:first_app/views/screens/squadride_screen/squadride_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDBChsk-oqno3B6kaVOhFoy0xtPrhmPrGM', 
        appId: '1:325477541210:android:36fc05605f7f714b1fff63', 
        messagingSenderId: '325477541210', 
        projectId: "first-app-57a08",
        storageBucket: 'gs://first-app-57a08.appspot.com'
        ),
    )
  : await Firebase.initializeApp();


  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.pickem : (context) => const PickEmScreen(),
        AppRoutes.moreGame : (context) => const MoreGamesScreen(),
        AppRoutes.entries : (context) => EntriesScreen(),
        AppRoutes.recentWins : (context) => RecentwinScreen(),
        AppRoutes.more  : (context) => const MoreScreen(),
        AppRoutes.reviewEntry  : (context) => const ReviewEntryScreen(),
        AppRoutes.squadride  : (context) => const SquadrideScreen()
      }, 
      home: LoginScreen(),
    );
  }
}

