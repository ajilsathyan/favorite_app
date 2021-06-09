import 'package:favorite_app/modals/dummy_data.dart';
import 'package:favorite_app/screens/recipe_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            physics: BouncingScrollPhysics(),
            children: DUMMY_CATEGORIES.map((e) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return RecipeScreen(
                      title: e.title,
                      color: e.color,
                      id: e.id,
                    );
                  }));
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(0.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text(
                      e.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: [e.color.withOpacity(0.3), e.color],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                ),
              );
            }).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}
