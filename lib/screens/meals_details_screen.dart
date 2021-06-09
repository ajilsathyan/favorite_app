import 'package:favorite_app/modals/meals_dummy_data.dart';
import 'package:favorite_app/provider/save_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsDetailScreen extends StatefulWidget {
  final String title;
  final String url;
  final String mealId;

  MealsDetailScreen({this.url, this.title, this.mealId});

  @override
  _MealsDetailScreenState createState() => _MealsDetailScreenState();
}

class _MealsDetailScreenState extends State<MealsDetailScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final meals =
        dummyMeals.firstWhere((element) => element.id == widget.mealId);
    final favoriteMeals = Provider.of<SaveFilters>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title == null ? "n" : widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 50,
                child: Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 20,
              left: 15,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFav == false ? Colors.blue : Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                  });
                  favoriteMeals.favoriteMeals(mealId: widget.mealId);
                },
              ),
            )
          ]),
          Text(
            'Ingredients',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 130,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: meals.ingredients.length,
              itemBuilder: (context, index) {
                return Text(meals.ingredients[index],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
              },
            ),
          ),
          Text(
            'Steps',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: meals.steps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("#${index + 1}"),
                  ),
                  title: Text(meals.steps[index],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
