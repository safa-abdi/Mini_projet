import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quote_course/salles-page.dart';
class CinemasP extends StatefulWidget{
  dynamic ville;
  CinemasP(this.ville);

  @override
  _CinemasPState createState()=> _CinemasPState();
}
class _CinemasPState extends State<CinemasP>{
  List<dynamic> listCinemas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cinemas de ${widget.ville['name']}"),),
      body: Center(
          child: this.listCinemas==null? CircularProgressIndicator():
          ListView.builder(
              itemCount: (this.listCinemas==null)?0:this.listCinemas.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text(this.listCinemas[index]['name']
                          ,style: TextStyle(color: Colors.blue)),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:(context)=> new SallesPage(listCinemas[index])));

                      },
                    ),
                  ),

                );

              }
          )
      ),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCinemas();
  }

  void loadCinemas() {
    String url=this.widget.ville['_links']['cinemas']['href'];
    http.get(Uri.parse(url)).then((resp){
      setState(() {
        this.listCinemas=json.decode(resp.body)['_embedded']['cinemas'];
      });

    }).catchError((err){
      print(err);

    });
  }



}