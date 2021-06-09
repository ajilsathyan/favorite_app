import 'package:favorite_app/provider/save_provider.dart';
import 'package:favorite_app/screens/meals_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<SaveFilters>(context);

    return meals.favoritedMeals.isEmpty
        ? Center(
            child: Text("no favorites yet!"),
          )
        : ListView.builder(
            itemCount: meals.favoritedMeals.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MealsDetailScreen(
                      title: meals.favoritedMeals[index].title,
                      url: meals.favoritedMeals[index].imageUrl,
                      mealId: meals.favoritedMeals[index].id,
                    );
                  }));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 50,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Image.network(
                                    meals.favoritedMeals[index].imageUrl,
                                    fit: BoxFit.cover,
                                  )),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 220,
                                color: Colors.black54,
                                child: Text(
                                  meals.favoritedMeals[index].title,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
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
