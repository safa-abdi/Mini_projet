import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cinema-page.dart';
import 'cinemap.dart';
import 'globalVariables.dart';
class VilleP extends StatefulWidget{
  @override
  _VillePState createState()=> _VillePState();
}
class _VillePState extends State<VilleP>{
  List<dynamic> listVilles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Villes'),),
      body: Center(
          child: this.listVilles==null? CircularProgressIndicator():
          ListView.builder(
              itemCount: (this.listVilles==null)?0:this.listVilles.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text(this.listVilles[index]['name']
                          ,style: TextStyle(color: Colors.blue)),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:(context)=> new CinemasP(listVilles[index])));

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
    loadVilles();
  }

  void loadVilles() async {
    //String url= await "http://192.168.42.152:8080/villes";
    String url=GlobalData.host+"/villes";
    http.get(Uri.parse(url))
        .then((resp){
      setState(() {
        this.listVilles=json.decode(resp.body)['_embedded']['villes'];
      });

    }).catchError((err){
      print(err);

    });
  }



}