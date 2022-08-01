class DiningHall {
  final Map data;
  late final String image;
  late String name;
  late String location;
  late List operatingHours;
  List eateryTypes = [];
  List<String> paymentMethods = [];
  Map diningItems = Map();
  bool isOpen = true;

  DiningHall({required this.data}) {
    print('constructing'.toUpperCase());
    name = data['name'];
    print(name);

    image = 'assets/dining_halls/${name}.jpg';

    data['eateryTypes'].forEach((item) {
      eateryTypes.add(item['descr']);
    });
    print(eateryTypes);

    location = data['campusArea']['descrshort'];
    print(location);

    operatingHours = List.from(data['operatingHours']);

    data['payMethods'].forEach((item) {
      paymentMethods.add(item['descrshort']);
    });

    data['diningItems'].forEach((item) {
      diningItems[item['category']] = [];
    });
    data['diningItems'].forEach((item) {
      diningItems[item['category']].add(item['item']);
    });

    print(diningItems);
  }

  void toggleOpen([String? status]) {
    if (status?.toLowerCase() == 'open' && status != null) {
      isOpen = true;
    } else if (status?.toLowerCase() == 'closed' && status != null) {
      isOpen = false;
    } else {
      isOpen = !isOpen;
    }
  }
}

/*

What's needed:
- Eatery name
- Eatery type
- Eatery location
- Eatery offerings (if listed)
- Eatery hours for the next 7 days
- Eatery menu (if any)
- Eatery payment methods

*/
