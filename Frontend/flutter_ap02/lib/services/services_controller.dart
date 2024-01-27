import 'dart:convert';
import 'package:http/http.dart' as http;

class Services_Controller{

  late String _correo;
  late String _contrasena;
  
  Services_Controller();

  Future<bool> login(String _correo,String _contrasena) async {

    var _url1='https://6w33tkx4f9.execute-api.us-east-1.amazonaws.com/RS_Usuarios?idUsuario='+_correo+'&clave='+_contrasena;
    /*Map data = {
      "idUsuario" : '$_correo',
      "clave": '$_contrasena',
    };
    //encode Map to JSON
    //var body = json.encode(data);*/

    var response=await http.get(Uri.parse(_url1));
    //var response = await http.post(Uri.parse(_url1), headers: {"Content-Type": "application/json"}, body: body);

    var body =jsonDecode(response.body);
    print("${response.statusCode}");
    print("${response.body}");

    var l=body["acceso"];
    return l;
    
  }

  Future<List<dynamic>> ver_documentos(String _correo) async {

    var _url2='https://6w33tkx4f9.execute-api.us-east-1.amazonaws.com/RS_Documentos?correo='+_correo;
    List<dynamic> _info=[{}];
    var response=await http.get(Uri.parse(_url2));
    var body =jsonDecode(response.body);

    for(var i in body["Items"]){

      _info.add(
        {
         "Fecha":i["Fecha"],
         "TipoAdjunto":i["TipoAdjunto"],
         "Nombre":i["Nombre"],
         "Apellido":i["Apellido"],
         "IdRegistro":i["IdRegistro"]
        }
      );
    }
    //print("${response.statusCode}");
    //print("${response.body}");
    //print(_info);

    //var l=body["acceso"];
    return _info;
    
  }

   Future<http.Response> registrar(String _idregistro,String _tdocumento,String _ndocumento,String _nombre,String _apellido,String _correo,String _ciudad,String _tadjunto,String _adjunto) async {

     _idregistro='ajaañio654eo';
     _tdocumento='Cedula de ciudadania';
     _ndocumento='12364';
     _nombre='andres';
     _apellido='Marquez';
     _correo='edison.montoya@sophossolutions.com';
     _ciudad='Pereira';
     _tadjunto='Imagen';
     _adjunto='vbasdhjbadjhabjhdba';

      DateTime dateToday =new DateTime.now(); 
      String _date = dateToday.toString().substring(0,10);

    var _url1='https://6w33tkx4f9.execute-api.us-east-1.amazonaws.com/RS_Documentos';
    
    Map data = {
			"IdRegistro": '$_idregistro',
			"Fecha": '$_date',
			"TipoId": '$_tdocumento',
			"Identificacion":'$_ndocumento',
			"Nombre": '$_nombre',
			"Apellido": '$_apellido',
			"Ciudad": '$_ciudad',
			"Correo": '$_correo',
			"TipoAdjunto": '$_tadjunto',
			"Adjunto": '$_adjunto'
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response=await http.post(Uri.parse(_url1), headers: {"Content-Type": "application/json"}, body: body);
    //var response = await http.post(Uri.parse(_url1), headers: {"Content-Type": "application/json"}, body: body);

    //var body =jsonDecode(response.body);
    print("${response.statusCode}");
    print("${response.body}");

    //var l=body["acceso"];
    return response;
    
  }


}