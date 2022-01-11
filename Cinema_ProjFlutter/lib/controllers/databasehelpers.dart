import 'dart:convert';
import 'package:http/http.dart' as http;

class DataBaseHelper {

  //function for update or put
  Future<http.Response> editerVille(String id, String nameController,
      int longitudeController, int latitudeController, int altitudeController) async {
    int a = int.parse(id);
    print(a);
    String url1 = 'http://192.168.100.198:8081/update';

    Map data = {
      'id': '$a',
      'name': '$nameController',
      'longitude': '$longitudeController',
      'latitude': '$latitudeController',
      'altitude':'$altitudeController'
    };
    //encode Map to JSON
    var body = json.encode(data);
    final Uri url = Uri.parse(url1);
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  // void editarProduct(
  //     String _id, String name, String price, String stock) async {

  //   String myUrl = "http://192.168.1.56:3000/product/$_id";
  //   http.put(myUrl, body: {
  //     "name": "$name",
  //     "price": "$price",
  //     "stock": "$stock"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }
  Future<http.Response> removeRegister(String id) async {
    int a = int.parse(id);
    print(a);
    var url1 ='http://192.168.100.198:8081/api/delvilles/$a';
    final Uri url = Uri.parse(url1);
    var response = await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
  Future<http.Response> removeRegisterCat(String id) async {
    int a = int.parse(id);
    print(a);
    var url1 ='http://192.168.100.198:8081/api/delcat/$a';
    final Uri url = Uri.parse(url1);
    var response = await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
  Future<http.Response> editerCateg(String id, String nameController) async {
    int a = int.parse(id);
    print(a);
    String url1 = 'http://192.168.100.198:8081/updateCateg';

    Map data = {
      'id': '$a',
      'name': '$nameController',
    };
    //encode Map to JSON
    var body = json.encode(data);
    final Uri url = Uri.parse(url1);
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

}