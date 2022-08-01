import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dining_hall.dart';
import '../models/dining_halls.dart';
import '../utils/constants_values.dart';
import '../widgets/card_date.dart';
import '../widgets/card_mealtime.dart';

class UpcomingMenusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: screenSize.height * 0.2,
          backgroundColor: Colors.blueAccent,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(kDefaultPadding),
            title: Text(
              'Upcoming Menus',
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
                padding: EdgeInsets.only(top: kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.075),
                      blurRadius: 30,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateCard(0),
                        DateCard(1),
                        DateCard(2),
                        DateCard(3),
                        DateCard(4),
                        DateCard(5),
                        DateCard(6),
                      ],
                    ),
                    Divider(
                      indent: screenSize.width * 0.05,
                      endIndent: screenSize.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealtimeCard('Breakfast'),
                        MealtimeCard('Lunch'),
                        MealtimeCard('Dinner'),
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<DiningHalls>(
                builder: (context, eateries, child) {
                  return Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          'West',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ...buildTextList(eateries.getMenu('West')),
                        Text(
                          'North',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ...buildTextList(eateries.getMenu('North')),
                        Text(
                          'Central',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ...buildTextList(eateries.getMenu('Central')),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

List<Widget> buildTextList(List<String> items) {
  List<Widget> textList = [];

  items.forEach((item) {
    textList.add(Text(
      item,
      style: TextStyle(),
    ));
    textList.add(Divider());
  });

  if (textList.isEmpty) {
    textList.add(Text('[Nothing here]'));
    textList.add(Divider());
  }
  textList.insert(0, Divider());

  return textList;
}
