
import 'package:favorite_app/modals/meals_dummy_data.dart';
import 'package:favorite_app/modals/meals_modal.dart';
import 'package:flutter/foundation.dart';

class SaveFilters with ChangeNotifier {
  Map<String, bool> saveFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> dummymeals = dummyMeals;
  saveFilter(Map<String, bool> savefilters) {
    saveFilters = savefilters;
    notifyListeners();
  }

  List filteredMeals() {
    return dummymeals = dummyMeals.where((meals) {
      if (saveFilters['gluten'] && meals.isGlutenFree) {
        notifyListeners();
        return false;
      }
      if (saveFilters['lactose'] && meals.isLactoseFree) {
        notifyListeners();
        return false;
      }
      if (saveFilters['vegan'] && meals.isVegan) {
        notifyListeners();
        return false;
      }
      if (saveFilters['vegetarian'] && meals.isVegetarian) {
        notifyListeners();
        return false;
      }
      notifyListeners();
      return true;
    }).toList();
  }

  bool isFavorite = false;
  List<Meal> favoritedMeals = [];
  // ignore: missing_return
  List favoriteMeals({String mealId}) {
    final existingMealId =
        favoritedMeals.indexWhere((element) => element.id == mealId);
    if (existingMealId >= 0) {
      isFavorite = false;
      notifyListeners();
      favoritedMeals.removeAt(existingMealId);
      notifyListeners();
    } else {
      isFavorite = true;
      notifyListeners();
      favoritedMeals.add(dummyMeals.firstWhere((meals) => meals.id == mealId));
      notifyListeners();
    }
  }
}
