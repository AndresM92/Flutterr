import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap02/services/services_controller.dart';
import 'package:flutter_ap02/windows/menu.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final text_clear1 = TextEditingController();
  final text_clear2 = TextEditingController();
  final _login= Services_Controller();

  String _email='';
  String _password='';

  @override
  Widget build(BuildContext context) { 
        return Scaffold(
           //   appBar: AppBar(backgroundColor: Colors.black,title: Text('Inicio Sesión'),),
            body: Container(
              alignment: Alignment.bottomCenter, 
              child:Column(
                children:[
                  Container(
                   //margin: EdgeInsets.all(50),
                    margin: EdgeInsets.fromLTRB(0.0, 100.0, 0, 80.0),
                    padding: EdgeInsets.all(10),  
                    alignment: Alignment.bottomCenter, 
                    width: 300.0,
                    child:Image.asset('images/bvc.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0, 15.0),
                    child: Text('Ingrese tus datos para acceder.', textAlign: TextAlign.center,style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                  ),
                  Container(
                        child: new ListView( 
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 5), 
                          shrinkWrap: true, 
                          children: [
                            _correo(),
                            Divider(),
                            _contrasena(),
                             Divider(),
                             Divider(),
                             _ingresar(),
                             Divider(),
                             _ingresar_huella(),
                            ],
                          ),
                      ),
                ]
              )
          )
      );
  }  


  Widget _correo(){
    return TextField(
      controller: text_clear1,
      keyboardType: TextInputType.emailAddress,
      //maxLength: 8,
      textAlign: TextAlign.left,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)),borderSide: new BorderSide(color: Colors.black,width: 3,)),hintText: 'Correo electrónico',hintStyle: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold), border: OutlineInputBorder( borderSide: BorderSide( color: Colors.black)), prefixIcon: const Icon(Icons.person_outline_outlined,color: Colors.red,size: 40),fillColor: Colors.red),
      onChanged: (valor){
        setState(() {
          _email=valor;
        });
      },
    );
  }

   Widget _contrasena(){
     int c = 3;
      return TextField(
      controller: text_clear2,
      keyboardType: TextInputType.text,
      //maxLength: 10,
      //textAlign: TextAlign.left,
      autofocus: true,
      obscureText: true,
      decoration:  const InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),borderSide: BorderSide(color: Colors.black,width: 3)),hintText: 'Contraseña', hintStyle: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold), border: OutlineInputBorder( borderSide: BorderSide( color: Colors.black)), prefixIcon: Icon(Icons.more_horiz_rounded,color: Colors.red,size: 40),fillColor: Colors.red ),
      onChanged: (valor){
        setState(() {
          _password=valor;
         /* final hash = Password.hash(valor, algorithm);
          _c=hash;*/
          //data.add({"p_nombre": p_nombre, "p_precio": p_precio, "p_imagen": "imagenes/"+(c).toString()+".jpg" });
        });
      },
    );
    
  }

    Widget _ingresar(){
    return Container(
      width: 200,
      height: 90,
      padding:EdgeInsets.fromLTRB(10, 0, 10, 0.0),
      child: RaisedButton(
        child: Text('Ingresar',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
        shape: StadiumBorder(),
       // minWidth: 100,
        //height: 45,
        autofocus:true,
        color: Colors.red[900],
        onPressed: () async {
          //text_clear1.clear();text_clear2.clear();
        if(_email.isNotEmpty && _password.isNotEmpty){
            var a=await _login.login(_email, _password);
            if (a==true){
           // _email='';_password='';
           //_login.ver_documentos("leonardo.cadavid@sophossolutions.com");
            Navigator.push(context, MaterialPageRoute(builder:(context)=>MenuPage()));
            //RouteTransition(context,child: MenuPage(data),type: AnimationType.scale,replacement: true,duration: Duration(milliseconds: 600),);
            //Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: MenuPage(data), duration: Duration(milliseconds: 600)));
          }else{
            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text('Credenciales incorrectas'),
                          content: Text('El usuario o la contraseña son incorrectos'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {_email='';_password='';Navigator.pop(context);},
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
                              onPressed: () {_email='';_password='';Navigator.pop(context);},
                              child: Text('Aceptar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
              } 
          
        },
      )
    );
  }

     Widget _ingresar_huella(){
    return Container(
      width: 200,
      height: 90,
      padding:EdgeInsets.fromLTRB(10, 0, 10, 0.0),

      child: OutlinedButton.icon(
        icon:const Icon(Icons.fingerprint,size: 70.0,color:Colors.black), 
        label: Text('Ingresar con huella',style: TextStyle(color: Colors.red[900],fontSize: 20.0,fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.red, width: 3),
          shape:  const StadiumBorder(
            side: BorderSide( width: 10, color: Colors.red),
            ),
        ),

        //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
       // minWidth: 100,
        //height: 45,
        //autofocus:true,
        
        onPressed: (){
          //Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: Registrar_usuario_Page(), duration: Duration(milliseconds: 600)));
          //Navigator.push(context, MaterialPageRoute(builder:(context)=>Registrar_usuario_Page()));
        }, 
        
        //shape: const Text('Ingresar',style: TextStyle(color: Colors.white,fontSize: 18)),
       // child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18),)
      
    )
    );
  }

}

