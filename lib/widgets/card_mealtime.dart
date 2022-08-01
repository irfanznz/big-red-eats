import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dining_halls.dart';
import '../utils/constants_values.dart';

class MealtimeCard extends StatelessWidget {
  final String meal;

  MealtimeCard(this.meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiningHalls>(
      builder: (context, eateries, child) {
        return GestureDetector(
          onTap: () {
            eateries.changeMeal(meal);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 3,
                kDefaultPadding, kDefaultPadding),
            child: Text(
              meal,
              style: TextStyle(
                color: meal == eateries.selectedMeal
                    ? Colors.blueAccent
                    : Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
