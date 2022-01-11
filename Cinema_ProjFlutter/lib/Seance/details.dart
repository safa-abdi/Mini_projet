import 'package:flutter/material.dart';
import 'package:quote_course/controllers/databasehelpers.dart';

import '../editVille.dart';
import '../main.dart';
import '../ville-page.dart';
import 'editSeance.dart';


class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainClass()),
    );

    if (result) {
      setState(() {});
    }
  }
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Vous etes sur d'éliminer '${widget.list[widget.index]['id']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK supprimée!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            databaseHelper
                .removeRegisterCat(widget.list[widget.index]['id'].toString());
            _navigateList(context);
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      new AppBar(title: new Text("${widget.list[widget.index]['id']}")),
      body: new Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['heureDebut'],
                  style: new TextStyle(fontSize: 20.0),
                ),

                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      /*onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new EditSeance(
                              list: widget.list,
                              index: widget.index,
                            ),
                          )),*/
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () => confirm(),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}