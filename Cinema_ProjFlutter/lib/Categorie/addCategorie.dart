import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Categorie.dart';

class AddCategorie extends StatefulWidget {
  const AddCategorie({Key  key}) : super(key: key);

  @override
  _AddCategorieState createState() => _AddCategorieState();
}

class _AddCategorieState extends State<AddCategorie> {
  final _formKey = GlobalKey<FormState>();

  String  newValue;
  String newValue1;
  Categorie cat = Categorie("");
  String urla = "http://192.168.1.24:8081/categories";

  TextEditingController name = TextEditingController();

  Future save(Ville) async {
    print(Ville.name);
    var res = await http.post(Uri.parse(urla),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': Ville.name,
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }
  //TextEditingController classe_cod_class = TextEditingController();
  //TextEditingController formation_id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Page')),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 570.0,
                            width: 340.0,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Add Ville",
                                      style: GoogleFonts.acme(fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: name,
                                        decoration: InputDecoration(
                                          hintText: "Name Categorie",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState == null) {}
                                          if (_formKey.currentState.validate()) {
                                            save(Categorie(name.text));
                                          }
                                        },
                                        child: Text("Add"))
                                  ],
                                )),
                          ),
                        ])))));
  }
}