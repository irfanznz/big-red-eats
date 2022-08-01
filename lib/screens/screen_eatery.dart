import 'package:flutter/material.dart';

import '../models/dining_hall.dart';
import '../utils/constants_values.dart';

class EateryScreen extends StatelessWidget {
  static const id = 'EateryScreen';
  final DiningHall eatery;

  EateryScreen(this.eatery);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: screenSize.height * 0.3,
            backgroundColor: Colors.blueAccent,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage(
                    image: AssetImage(
                      eatery.image,
                    ),
                    placeholder:
                        AssetImage('assets/dining_halls/placeholder.png'),
                    imageErrorBuilder: (x, y, z) {
                      return Image.asset(
                        'assets/dining_halls/placeholder.png',
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8)
                      ],
                      stops: [0.6, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.repeated,
                    )),
                  ),
                ],
              ),
              titlePadding: EdgeInsets.all(kDefaultPadding),
              title: Text(
                eatery.name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: screenSize.width,
                  height: 2000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
