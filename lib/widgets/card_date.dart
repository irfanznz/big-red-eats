import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/dining_halls.dart';
import '../utils/constants_values.dart';

class DateCard extends StatelessWidget {
  final int offset;

  DateCard(this.offset);

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now().add(Duration(days: offset));

    final String dayOfWeek = DateFormat('EEE').format(date);
    final String day = DateFormat('d').format(date);

    return Consumer<DiningHalls>(
      builder: (context, eateries, child) {
        return GestureDetector(
          onTap: () {
            eateries.changeDate(date);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: day == eateries.selectedDate
                      ? Colors.grey.shade800
                      : Colors.grey,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(text: dayOfWeek),
                  TextSpan(
                    text: '\n$day',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
