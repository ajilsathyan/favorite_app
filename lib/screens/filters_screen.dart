import 'package:favorite_app/provider/save_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  ///

  ///
  @override
  Widget build(BuildContext context) {
    var savefilters = Provider.of<SaveFilters>(context);
    bool isLactoseFree = savefilters.saveFilters['lactose'];
    bool isVegetarian = savefilters.saveFilters['vegetarian'];
    bool isVegan = savefilters.saveFilters['vegan'];
    bool isGlutenFree = savefilters.saveFilters['gluten'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                savefilters.filteredMeals();
              },

              //Save Filters

              icon: Icon(Icons.save))
        ],
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "Adjust your meal section",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    title: "GlutenFree",
                    value: savefilters.saveFilters['gluten'],
                    onChanged: (value) {
                      setState(() {
                        isGlutenFree = value;
                      });
                      savefilters.saveFilter({
                        'vegan': isVegan,
                        'gluten': isGlutenFree,
                        'lactose': isLactoseFree,
                        'vegetarian': isVegetarian,
                      });
                    },
                    subTitle: "Only include Gluten Free meals "),
                buildSwitchListTile(
                    title: "VeganFree",
                    value: savefilters.saveFilters['vegan'],
                    onChanged: (v) {
                      setState(() {
                        isVegan = v;
                      });
                      savefilters.saveFilter({
                        'vegan': isVegan,
                        'gluten': isGlutenFree,
                        'lactose': isLactoseFree,
                        'vegetarian': isVegetarian,
                      });
                    },
                    subTitle: "Only include Vegan Free meals "),
                buildSwitchListTile(
                    title: "Vegetarian",
                    value: savefilters.saveFilters['vegetarian'],
                    onChanged: (value) {
                      setState(() {
                        isVegetarian = value;
                        savefilters.saveFilter({
                          'vegetarian': isVegetarian,
                        });
                        savefilters.saveFilter({
                          'vegan': isVegan,
                          'gluten': isGlutenFree,
                          'lactose': isLactoseFree,
                          'vegetarian': isVegetarian,
                        });
                      });
                    },
                    subTitle: "Only include Vegetarian meals "),
                buildSwitchListTile(
                    title: "LactoseFree",
                    value: savefilters.saveFilters['lactose'],
                    onChanged: (value) {
                      setState(() {
                        isLactoseFree = value;
                        savefilters.saveFilter({
                          'lactose': isLactoseFree,
                        });
                        savefilters.saveFilter({
                          'vegan': isVegan,
                          'gluten': isGlutenFree,
                          'lactose': isLactoseFree,
                          'vegetarian': isVegetarian,
                        });
                      });
                    },
                    subTitle: "Only include LactoseFree meals"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {String title, bool value, String subTitle, Function onChanged}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
