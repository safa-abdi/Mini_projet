import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:quote_course/Seance/Seance.dart';


class addSeance extends StatefulWidget {
  const addSeance({Key  key}) : super(key: key);

  @override
  _addSeanceState createState() => _addSeanceState();
}

class _addSeanceState extends State<addSeance> {
  final _formKey = GlobalKey<FormState>();

  String  newValue;
  String newValue1;
  Seance cat = Seance("");
  String urla = "http://192.168.100.198:8081/apis/seances";

  final dateTextController = TextEditingController();
  final df = DateFormat('dd-MM-yyyy');
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1995),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      dateTextController.text = df.format(pickedDate);
    }
  }
  Future save(Seance) async {
    print(Seance.heureDebut);
    var res = await http.post(Uri.parse(urla),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': Seance.heureDebut,
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
        appBar: AppBar(title: Text('Add Seance')),
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
                                      "Add Seance",
                                      style: GoogleFonts.acme(fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: dateTextController,
                                        decoration: InputDecoration(
                                          hintText: "Date seance",
                                          border: OutlineInputBorder(),
                                        ),
                                      onTap: () {
                                           _selectDate(context);
                                             },),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState == null) {}
                                          if (_formKey.currentState.validate()) {
                                            save(Seance(dateTextController.text));
                                          }
                                        },
                                        child: Text("Add"))
                                  ],
                                )),
                          ),
                        ])))));
  }
}