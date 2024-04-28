import 'package:get/get.dart';
import '../model/coffee.dart';

class AppController extends GetxController {
  int currIndex = 0;

  set navigate(int index) {
    currIndex = index;
    update();
  }

  List<Coffee> coffees = [
    Coffee(
      image: 'Cold Coffee.png',
      name: 'Cold Coffee',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 30.99,
      volume: 60,
    ),
    Coffee(
      image: 'Black Coffee.png',
      name: 'Black Coffee',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 20.99,
      volume: 60,
    ),
    Coffee(
      image: 'Espresso.png',
      name: 'Espresso',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 25.00,
      volume: 60,
    ),
    Coffee(
      image: 'Latte.png',
      name: 'Latte',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 30.00,
      volume: 60,
    ),
    Coffee(
      image: 'Cold Coffee.png',
      name: 'Cold X Coffee',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 35.50,
      volume: 60,
    ),
    Coffee(
      image: 'Black Coffee.png',
      name: 'Black X Coffee',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 15.00,
      volume: 60,
    ),
    Coffee(
      image: 'Espresso.png',
      name: 'Espresso X',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 20.00,
      volume: 60,
    ),
    Coffee(
      image: 'Latte.png',
      name: 'Latte X',
      category: 'BEST COFFEE',
      description:
          'Coffee is a major source of antioxidants in the diet. It has many health benefits',
      price: 30.50,
      volume: 60,
    ),
  ];
  List<Coffee> favourite = [];
  List<Coffee> filtered = [];
  bool isSearching = false;

  void onFavouriteClick(Coffee coffee) {
    coffee.isFavourite = !coffee.isFavourite;
    if (favourite.contains(coffee)) {
      favourite.remove(coffee);
    } else {
      favourite.add(coffee);
    }
    update();
  }

  void filter(String text) {
    if (text.trim() != '') {
      filtered = coffees
          .where((element) =>
              element.name.toLowerCase().startsWith(text.trim().toLowerCase()))
          .toList();
      isSearching = true;
    } else {
      isSearching = false;
    }
    update();
  }
}
