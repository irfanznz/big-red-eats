import 'package:big_red_eats/screens/home.dart';
import 'package:big_red_eats/screens/screen_eatery.dart';
import 'package:flutter/material.dart';

import '../models/dining_hall.dart';

class DiningHallCard extends StatelessWidget {
  final DiningHall diningHall;

  DiningHallCard({required this.diningHall});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EateryScreen.id, arguments: diningHall);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: screenSize.width - 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              blurRadius: 15,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: FadeInImage(
                image: AssetImage(
                  diningHall.image,
                ),
                placeholder: AssetImage('assets/dining_halls/white.jpg'),
                imageErrorBuilder: (x, y, z) {
                  return Image.asset(
                    'assets/dining_halls/placeholder.png',
                    height: screenSize.height * 0.125,
                    fit: BoxFit.cover,
                  );
                },
                height: screenSize.height * 0.125,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  text: '${diningHall.name}\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                  children: [
                    TextSpan(
                      text: 'Open until',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
