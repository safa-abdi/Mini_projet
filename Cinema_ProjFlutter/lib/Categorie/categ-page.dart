import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_course/Categorie/details.dart';

import 'addcat.dart';

class CategPage extends StatefulWidget {
  @override
  _CategPageState createState() => _CategPageState();
}

class _CategPageState extends State<CategPage> {
  List data;

  Future<List> getAllData() async {
    String url1 = 'http://192.168.100.198:8081/apia/categories';
    final Uri url = Uri.parse(url1);
    http.Response response = await http.get(url);
    final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  }

  @override
  void initState() {
    super.initState();
    this.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Listes Catégories"),
        automaticallyImplyLeading: false, //evita que muestre flecha de regresar
        actions: [
          RaisedButton(
            color: Colors.black12,
            child: Icon(Icons.add),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addcat()));
            },
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              padding: const EdgeInsets.all(1.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      )),
                ),

                child: Container(
                  //color: Colors.black,
                  height: 80.3,
                  child: new Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: RaisedButton(
                                  color: Colors.white,
                                  child: Text(list[i]['name'].toString(),
                                      style: TextStyle(color: Colors.blue,fontSize: 24)),
                                  onLongPress: (){

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}