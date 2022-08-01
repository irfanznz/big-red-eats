import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dining_halls.dart';

class FilterButton extends StatefulWidget {
  final String text;

  FilterButton({required this.text});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (isSelected) {
          Provider.of<DiningHalls>(context, listen: false)
              .addFilter(widget.text);
        } else {
          Provider.of<DiningHalls>(context, listen: false)
              .removeFilter(widget.text);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return isSelected
                  ? Colors.blueAccent.shade400
                  : Colors.grey.shade300;
            } else {
              return isSelected ? Colors.blueAccent : Colors.grey.shade100;
            }
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(0, 0)),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: isSelected ? Colors.grey.shade50 : Colors.blueAccent,
        ),
      ),
    );
  }
}
