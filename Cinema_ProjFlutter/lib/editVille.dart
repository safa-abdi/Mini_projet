import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quote_course/ville-page.dart';
import 'package:http/http.dart' as http;

import 'controllers/databasehelpers.dart';
import 'main.dart';

class EditVille extends StatefulWidget {
  final List list;
  final int index;

   EditVille({this.list, this.index});

  @override
  _EditVilleState createState() => _EditVilleState();
}

class _EditVilleState extends State<EditVille> {
  Future<List> getData() async {
    String url1 = 'http://192.168.100.198:8081/api/villes';
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(url1), headers: headers);
    final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  }
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerLongitude;
  TextEditingController controllerLatitude;
  TextEditingController controllerAltitude;
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
    controllerLongitude = new TextEditingController(
        text: widget.list[widget.index]['longitude'].toString());
    controllerLatitude = new TextEditingController(
        text: widget.list[widget.index]['latitude'].toString());
    controllerAltitude = new TextEditingController(
        text: widget.list[widget.index]['altitude'].toString());
    super.initState();

  }
  Future deleteVille(int id) async {
    String url ='http://192.168.1.24:8081/api/delvilles/$id';
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
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerLongitude,
                    decoration: new InputDecoration(
                      hintText: "longitude",
                      labelText: "longitude",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerLatitude,
                    decoration: new InputDecoration(
                      hintText: "latitude",
                      labelText: "latitude",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerAltitude,
                    decoration: new InputDecoration(
                      hintText: "altitude",
                      labelText: "altitude",
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
                    databaseHelper.editerVille(
                        controllerId.text.trim(),
                        controllerName.text.trim(),
                        int.parse(controllerLongitude.text.trim()),
                        int.parse(controllerLatitude.text.trim()),
                        int.parse(controllerAltitude.text.trim()));
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