import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quote_course/controllers/databasehelpers.dart';
import 'package:quote_course/ville-page.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class EditCategorie extends StatefulWidget {
  final List list;
  final int index;

  EditCategorie({this.list, this.index});

  @override
  _EditCategorieState createState() => _EditCategorieState();
}

class _EditCategorieState extends State<EditCategorie> {
  Future<List> getData() async {
    String url1 = 'http://192.168.100.198:8081/api/categories';
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(url1), headers: headers);
    final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  }
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerId;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainClass()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    controllerName = new TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    super.initState();

  }
  Future deleteVille(int id) async {
    String url ='http://192.168.1.24:8081/api/delCat/$id';
    var response = await http.post(Uri.parse(url));
    if(response.statusCode==200){
      return ;
    }else{
      print(response);
      throw Exception('Erreuur');
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Edit product"),
      // ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerId,
                    decoration: new InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerName,
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.editerCateg(
                        controllerId.text.trim(),
                        controllerName.text.trim(),
                    );
                    _navigateList(context);

                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}