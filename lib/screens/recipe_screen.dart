
import 'package:favorite_app/modals/meals_modal.dart';
import 'package:favorite_app/provider/save_provider.dart';
import 'package:favorite_app/screens/meals_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RecipeScreen extends StatefulWidget {
  final String title;
  final Color color;
  final String id;
  RecipeScreen({this.color, this.title, this.id});

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isFavoriteSelected = false;
  @override
  Widget build(BuildContext context) {
    final dummyMealsFromProvider = Provider.of<SaveFilters>(context);
    final meals = dummyMealsFromProvider.dummymeals.where((element) {
      return element.categories.contains(widget.id);
    }).toList();

    String complexity(int index) {
      switch (meals[index].complexity) {
        case Complexity.Simple:
          return "Simple";
          break;
        case Complexity.Challenging:
          return "Challenging";
          break;
        case Complexity.Hard:
          return "Hard";
          break;
        default:
          return "Unknown";
      }
    }

    String affordability(int index) {
      switch (meals[index].affordability) {
        case Affordability.Affordable:
          return "Affordable";
          break;
        case Affordability.Pricey:
          return "Pricey";
          break;
        case Affordability.Luxurious:
          return "Expensive";
          break;
        default:
          return "Unknown";
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MealsDetailScreen(
                  title: meals[index].title,
                  url: meals[index].imageUrl,
                  mealId: meals[index].id,
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
                              height: MediaQuery.of(context).size.width - 90,
                              child: Image.network(
                                meals[index].imageUrl,
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
                              meals[index].title,
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
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${meals[index].duration} min"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.work),
                              SizedBox(
                                width: 5,
                              ),
                              Text(complexity(index)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(
                                width: 5,
                              ),
                              Text(affordability(index)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
