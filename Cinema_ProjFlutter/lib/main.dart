
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_course/ville-p.dart';
import 'package:quote_course/ville-page.dart';
import 'dart:convert';

import 'Categorie/categ-page.dart';
import 'Seance/seance-page.dart';
import 'controllers/ListVilles.dart';
import 'editVille.dart';
import 'menuItem.dart';



class MainClass extends StatefulWidget {

  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  final menus = [
    {'title': 'Villes', 'icon': Icon(Icons.home), 'page': VillePage()},
    {'title': 'Categories', 'icon': Icon(Icons.ten_mp), 'page': CategPage()},
    {'title': 'Seance', 'icon': Icon(Icons.ten_mp), 'page': SeancePage()},
    {'title': 'Cinemas', 'icon': Icon(Icons.eleven_mp_outlined), 'page': VilleP()},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema Page"),
      ),
      body: Center(
        child: Text("Home cinema..."),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(""),
                  radius: 20,
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.white, Colors.green])),
            ),
            ...this.menus.map((item) {
              return new Column(
                children: [
                  Divider(
                    color: Colors.green,
                  ),
                  MenuItem(item['title'], item['icon'], (context) {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => item['page']));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
