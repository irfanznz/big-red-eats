import 'package:big_red_eats/screens/home.dart';
import 'package:big_red_eats/screens/screen_eatery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dining_hall.dart';
import 'models/dining_halls.dart';

void main() {
  runApp(BigRedEats());
}

class BigRedEats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiningHalls>(
      create: (context) => DiningHalls(),
      child: MaterialApp(
        title: 'Big Red Eats',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blueAccent,
            elevation: 0,
          ),
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          EateryScreen.id: (context) => EateryScreen(
              ModalRoute.of(context)?.settings.arguments as DiningHall),
        },
        // onGenerateRoute: (settings) {
        //   if (settings.name == EateryScreen.id) {
        //     return MaterialPageRoute(
        //       builder: (context) {
        //         return EateryScreen(eatery: settings.arguments as DiningHall);
        //       },
        //     );
        //   }
        // },
      ),
    );
  }
}
