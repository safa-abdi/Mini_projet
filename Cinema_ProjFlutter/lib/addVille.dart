import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Ville.dart';

class AddVille extends StatefulWidget {
  const AddVille({Key  key}) : super(key: key);

  @override
  _AddVilleState createState() => _AddVilleState();
}

class _AddVilleState extends State<AddVille> {
  final _formKey = GlobalKey<FormState>();

   String  newValue;
   String newValue1;
   Ville ville = Ville("", 0, 0, 0);
  String urla = "http://192.168.100.198:8081/villes";

  TextEditingController name = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController altitude = TextEditingController();
  Future save(Ville) async {
    print(Ville.name);
    print(Ville.longitude);
    print(Ville.latitude);
    print(Ville.altitude);
    var res = await http.post(Uri.parse(urla),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': Ville.name,
          'longitude': Ville.longitude,
          'latitude': Ville.latitude,
          'altitude': Ville.altitude,
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
                                          hintText: "Name Ville",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: altitude,
                                        decoration: InputDecoration(
                                          hintText: "Altitude Ville",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: longitude,
                                        decoration: InputDecoration(
                                          hintText: "longitude",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: latitude,
                                        decoration: InputDecoration(
                                          hintText: "latitude ",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),

                                    ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState == null) {}
                                          if (_formKey.currentState.validate()) {
                                            save(Ville(name.text, int.parse(longitude.text),
                                                int.parse(latitude.text),int.parse(altitude.text)));
                                          }
                                        },
                                        child: Text("Add"))
                                  ],
                                )),
                          ),
                        ])))));
  }
}