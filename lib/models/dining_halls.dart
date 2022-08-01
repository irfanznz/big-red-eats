import 'dart:collection';

import 'package:big_red_eats/models/dining_hall.dart';
import 'package:big_red_eats/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String url =
    'https://now.dining.cornell.edu/api/1.0/dining/eateries.json';

class DiningHalls extends ChangeNotifier {
  List<DiningHall> _diningHalls = [];
  List<DiningHall> _selectedDiningHalls = [];
  List<String> _filters = [];
  DateTime _selectedDate = DateTime.now();
  String _selectedMeal = 'Breakfast';

  DiningHalls() {
    generateDiningHallsFromData();
  }

  UnmodifiableListView<DiningHall> get diningHalls {
    return UnmodifiableListView(_selectedDiningHalls);
  }

  Future<dynamic> getDiningHallsData() async {
    NetworkHelper networkHelper = NetworkHelper(url);

    var diningHallsData = await networkHelper.getData();
    return diningHallsData;
  }

  void generateDiningHallsFromData() async {
    var diningHallsData = await getDiningHallsData();

    diningHallsData['data']['eateries'].forEach(
      (details) {
        _diningHalls.add(DiningHall(data: details));
      },
    );

    // _diningHalls.sort((a, b) {
    //   return a.name.compareTo(b.name);
    // });

    _selectedDiningHalls = List<DiningHall>.from(_diningHalls);
    notifyListeners();
  }

  void _filterDiningHalls() {
    if (_filters.isEmpty) {
      _selectedDiningHalls = List<DiningHall>.from(_diningHalls);
      notifyListeners();
      return;
    }

    _selectedDiningHalls.clear();

    _diningHalls.forEach(
      (diningHall) {
        if (_filters.contains(diningHall.location)) {
          _selectedDiningHalls.add(diningHall);
        }
      },
    );
    notifyListeners();
  }

  void addFilter(String filter) {
    _filters.add(filter);
    _filterDiningHalls();
  }

  void removeFilter(String filter) {
    _filters.remove(filter);
    _filterDiningHalls();
  }

  List<String> getMenu(String location) {
    List<String> menu = [];
    String currentDate = DateFormat('y-MM-dd').format(_selectedDate).toString();
    print(currentDate);

    _diningHalls.forEach((eatery) {
      if (eatery.location == location) {
        eatery.operatingHours.forEach((day) {
          if (day['date'] == currentDate) {
            day['events'].forEach((event) {
              if (event['descr'] == _selectedMeal ||
                  ((_selectedMeal == 'Breakfast' || _selectedMeal == 'Lunch') &&
                      event['descr'] == 'Brunch')) {
                event['menu'].forEach((category) {
                  category['items'].forEach((item) {
                    menu.add(item['item']);
                  });
                });
              }
            });
          }
        });
      }
    });

    return menu;
  }

  get selectedDate {
    return DateFormat('d').format(_selectedDate);
  }

  get selectedMeal {
    return '$_selectedMeal';
  }

  void changeDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void changeMeal(String meal) {
    _selectedMeal = meal;
    notifyListeners();
  }
}
