enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isFavorite;

  Meal(
      {this.id,
      this.categories,
      this.title,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.complexity,
      this.affordability,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isFavorite,
      this.isLactoseFree});
}
