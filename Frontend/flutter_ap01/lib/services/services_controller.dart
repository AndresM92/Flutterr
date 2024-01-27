import 'dart:convert';
import 'package:http/http.dart' as http;

class Services_Controller{

  late String _name;
  late String _cc;
  
  Services_Controller();

  Future<http.Response> guardar_usuario(String _cc,String _name, String _lastname,int _age,String _numberphone,String _email) async {

    var _url1='http://192.168.100.79:8080/user/save';
    Map data = {
      "cc" : '$_cc',
      "name": '$_name',
      "last_name":'$_lastname',
      "age": '$_age',
      "number_phone": '$_numberphone',
      "email":'$_email'
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(_url1), headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }


  Future<bool> existsName(String name) async {
    this._name=name;
    var _url2='http://192.168.100.79:8080/user/search_name/';

    var response=await http.get(Uri.parse(_url2+_name));
    var jsonbool=jsonDecode(response.body);

    /*for(var i=0;i<7;i++){
      imagenes.add(jsonImg[i]["url"]);
      //print(imagenes);
    }*/
    bool a=jsonbool;

    return a;
  }

  Future<bool> existsCc(String cc) async {
    this._cc=cc;
    var _url3='http://192.168.100.79:8080/user/search_cc/';

    var response=await http.get(Uri.parse(_url3+_cc));
    var jsonbool=jsonDecode(response.body);

    /*for(var i=0;i<7;i++){
      imagenes.add(jsonImg[i]["url"]);
      //print(imagenes);
    }*/
    bool a=jsonbool;

    return a;
  }


}