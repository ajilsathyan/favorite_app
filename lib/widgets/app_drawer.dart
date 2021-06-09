import 'package:favorite_app/screens/filters_screen.dart';
import 'package:favorite_app/screens/tabBar_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: CircleAvatar(
              radius: 30,
              child: Icon(Icons.person),
            ),
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => TabBarScreen()));
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FiltersScreen()));
          }),
        ],
      ),
    );
  }
}
