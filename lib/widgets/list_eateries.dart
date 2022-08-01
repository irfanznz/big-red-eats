import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../models/dining_hall.dart';
import '../models/dining_halls.dart';
import 'card_dining_hall.dart';

class EateryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DiningHalls>(
      builder: (context, eateries, child) {
        return Column(
          children:
              generateCards(eateries.diningHalls, MediaQuery.of(context).size),
        );
      },
    );
  }
}

List<Widget> generateCards(List<DiningHall> list, Size screenSize) {
  List<Widget> cardList = [];

  if (list.isEmpty) {
    return [
      Container(
        height: screenSize.height / 2,
        child: SpinKitCubeGrid(
          color: Colors.blueAccent.shade100,
          size: screenSize.width * 0.1,
        ),
      ),
    ];
  }

  list.forEach(
    (element) {
      cardList.add(DiningHallCard(diningHall: element));
    },
  );

  return cardList;
}
