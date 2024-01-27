import 'package:animated_background/animated_background.dart';
import 'package:custom_route_transition_test/custom_route_transition_test.dart';
import 'package:flutter_ap01/widget/fondo.dart';
import 'package:flutter_ap01/widget/indicador_loading.dart';
import 'package:page_transition/page_transition.dart';
import 'menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap01/windows/registrar_usuario.dart';
import 'package:flutter_ap01/services/services_controller.dart';
import 'package:flutter_ap01/windows/menu.dart';
import 'package:flutter_ap01/services/provider_data.dart';
import 'package:password/password.dart';



class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  final img=new Provider_Data();  
  final text_clear1 = TextEditingController();
  final text_clear2 = TextEditingController();
  final _logg= Services_Controller();


  //final password = 'secret';
  final algorithm = PBKDF2();

   List data=[
    {
      "p_nombre":"Aceite Motul 5100",
      "p_precio":"\$31.000,00",
      "p_imagen":'https://via.placeholder.com/600/24f355',
    },
    {
      "p_nombre":"Calcomani completa DT 125",
      "p_precio":"\$25.000,00",
      "p_imagen":'https://via.placeholder.com/600/d32776',
    },
    {
      "p_nombre":"Pastillas freno DT 125",
      "p_precio":"\$16.000,00",
      "p_imagen":'https://via.placeholder.com/600/f66b97',
    },
  ];

  String _u='';
  String _c='';
  bool _isButtonDisabled=true;

  @override
  Widget build(BuildContext context) { 
        // var k = Random();
         //var a = 5;//k.nextInt(7);
         //print(a);
        return Scaffold(
              appBar: AppBar( 
              backgroundColor: Colors.black,
              title: Text('Inicio Sesión'),
            ),
            body: Container(
              child:AnimatedBackground(
                behaviour: RacingLinesBehaviour(),
                vsync: this,
              child: Container( 
                padding: EdgeInsets.fromLTRB(10, 50, 10, 50), 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54,width: 5),
                 //image:DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/71/8d/1d/718d1d79a48970512b0aa7e91ea5b478.jpg')),
                 //image:DecorationImage(image: FondoPage()),
                  borderRadius: BorderRadius.circular(40)
                  ),
                child: SingleChildScrollView(
                  child: Column( 
                    children: [
                      Container( 
                        padding: EdgeInsets.all(15.0), 
                        margin: EdgeInsets.all(5), 
                        alignment: Alignment.bottomCenter, 
                        child:FutureBuilder(future:img.cargar_api(),builder: (context,AsyncSnapshot<List<dynamic>> snapshot){print(snapshot.data);if (snapshot.hasData){ return Image.network(snapshot.data![1]);} return Indicador_loading();}),//Image.asset('imagenes/inicio.png'), 
                        width:280
                        ),
                      Container(
                        child: new ListView( 
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 5), 
                          shrinkWrap: true, 
                          children: [
                            _usuario(),
                            Divider(),
                            _contrasena(),
                             Divider(),
                            _iniciar_sesion(),
                            Divider(),
                            _crear_usuario(),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      );
  }

  Widget _usuario(){
    return TextField(
      controller: text_clear1,
      keyboardType: TextInputType.text,
      maxLength: 8,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Nombre',labelText: 'Nombre',prefixIcon: const Icon(Icons.people),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _u=valor;
        });
      },
    );
  }

   Widget _contrasena(){
     int c = 3;
    var textField = TextField(
      controller: text_clear2,
      keyboardType: TextInputType.text,
      maxLength: 10,
      textAlign: TextAlign.center,
      autofocus: true,
      obscureText: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Contraseña',labelText: 'Contraseña',prefixIcon: const Icon(Icons.security_outlined),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _c=valor;
         /* final hash = Password.hash(valor, algorithm);
          _c=hash;*/
          //data.add({"p_nombre": p_nombre, "p_precio": p_precio, "p_imagen": "imagenes/"+(c).toString()+".jpg" });
        });
      },
    );
    return textField;
  }

  Widget _iniciar_sesion(){
    return Container(
      width: 40,
      height: 50,
      padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: RaisedButton.icon(
        shape: StadiumBorder(),
       // minWidth: 200.0,
        //height: 50,
        icon:Icon(Icons.login), 
        autofocus:true,
        color: Colors.blue[700],
        onPressed: () async {
          text_clear1.clear();text_clear2.clear();
          if(_c.isNotEmpty && _u.isNotEmpty){
            if ((await _logg.existsCc(_c)==true) && (await _logg.existsName(_u)==true) ){
            _c='';_u='';
            //RouteTransition(context,child: MenuPage(data),type: AnimationType.scale,replacement: true,duration: Duration(milliseconds: 600),);
            Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: MenuPage(data), duration: Duration(milliseconds: 600)));
          }else{
            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text('Credenciales incorrectas'),
                          content: Text('Verifique el usuario o contraseña'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {_c='';_u='';Navigator.pop(context);},
                              child: Text('Aceptar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
              } 
          }else{
            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text('Campos vacios'),
                          content: Text('Verifique el usuario o contraseña'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {_c='';_u='';Navigator.pop(context);},
                              child: Text('Aceptar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
              } 
          
        }, 
        label: Text('Iniciar Sesion',style: TextStyle(color: Colors.white,fontSize: 18))
      ),
    );
  }

  Widget _crear_usuario(){
    return Container(
      width: 40,
      height: 50,
      padding:EdgeInsets.fromLTRB(40, 0, 40, 5),
      child: RaisedButton.icon(
        shape: StadiumBorder(),
       // minWidth: 100,
        //height: 45,
        autofocus:true,
        color: Colors.green,
        onPressed: (){
          Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: Registrar_usuario_Page(), duration: Duration(milliseconds: 600)));
          //Navigator.push(context, MaterialPageRoute(builder:(context)=>Registrar_usuario_Page()));
        }, 
        icon:Icon(Icons.person_add_alt_1), 
        label: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18)),
       // child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18),)
      )
    );
  }
  

}

