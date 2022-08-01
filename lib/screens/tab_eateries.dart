import 'package:flutter/material.dart';

import '../utils/constants_values.dart';
import '../widgets/button_filter.dart';
import '../widgets/list_eateries.dart';

class EateriesTab extends StatelessWidget {
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
              'Big Red Eats',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverAppBar(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.fromLTRB(
              kDefaultPadding,
              0,
              kDefaultPadding,
              kDefaultPadding * 2,
            ),
            title: Container(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Search eateries and menus',
                  contentPadding: EdgeInsets.all(0),
                  alignLabelWithHint: true,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      FilterButton(
                        text: 'Nearest First',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'Favorites',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'North',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'West',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'Central',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'Swipes',
                      ),
                      SizedBox(
                        width: kDefaultPadding * (2 / 3),
                      ),
                      FilterButton(
                        text: 'BRBs',
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      kDefaultPadding,
                      kDefaultPadding / 6,
                      kDefaultPadding,
                      kDefaultPadding - 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Open',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                EateryList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
