import 'dart:convert';
import 'package:http/http.dart' as http;

class Provider_Data {

  Provider_Data(){cargar_api();}

  Future<List<dynamic>> cargar_api() async {
    List<dynamic> imagenes=[];

    var response=await http.get(Uri.https('jsonplaceholder.typicode.com','photos'));
    var jsonImg=jsonDecode(response.body);

    for(var i=0;i<3;i++){
      imagenes.add(jsonImg[i]["url"]);
      //print(imagenes);
    }
    return imagenes;
  }


}