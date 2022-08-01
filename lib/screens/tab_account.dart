import 'package:flutter/material.dart';

import '../utils/constants_values.dart';

class AccountTab extends StatelessWidget {
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
              'Account Details',
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
                padding: EdgeInsets.fromLTRB(kDefaultPadding,
                    kDefaultPadding / 6, kDefaultPadding, kDefaultPadding - 2),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
