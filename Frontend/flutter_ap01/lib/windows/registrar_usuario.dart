import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap01/services/services_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_ap01/windows/menu.dart';
import 'package:http/src/response.dart';
import 'package:page_transition/page_transition.dart';
import 'package:password/password.dart';
import 'login.dart';
import 'menu.dart';


class Registrar_usuario_Page extends StatefulWidget {

  @override
  State<Registrar_usuario_Page> createState() => _Registrar_usuario_PageState();
}

class _Registrar_usuario_PageState extends State<Registrar_usuario_Page> {

  final text_clear1 = TextEditingController();
  final text_clear2 = TextEditingController();
  final text_clear3 = TextEditingController();
  final text_clear4 = TextEditingController();
  final text_clear5 = TextEditingController();
  final text_clear6 = TextEditingController();
  


  //final password = 'secret';
  //final algorithm = PBKDF2();

 
  String _cedula='';
  String _nombre='';
  String _apellido='';
  String _edad='';
  late String _edadS;
  String _celular='';
  String _email='';
  final _registrar=Services_Controller();
  final _formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) { 
        return Scaffold(
            appBar: AppBar( backgroundColor: Colors.black,
            title: Text('Registrar nuevo usuario'),
          ),
          body:Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column( 
                    children: [
                      Icon(Icons.person_add_rounded,size: 80,),
                      Form(
                        key: _formKey,
                        child: new ListView( 
                            padding: EdgeInsets.fromLTRB(5, 30, 10, 0), 
                            shrinkWrap: true, 
                            children: [
                              _cc(),
                              Divider(),
                              nombre(),
                              Divider(),
                              apellido(),
                              Divider(),
                              edad(),
                              Divider(),
                              celular(),
                              Divider(),
                              email(),
                              Divider(),
                              guardar(),
                              Divider(),
                              ],
                            ),
                      ),
                    ],
                ),
            ),
              ),
          );
  }

  Widget _cc(){
    
    return TextFormField(
        validator: (value) {
        if (value!.isEmpty) {return 'Ingrese un numero de identicacion';}},
        controller: text_clear1,
        keyboardType:TextInputType.number,
        maxLength: 13,
        textAlign: TextAlign.center,
        autofocus: true,
        decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Numero de identicacion',labelText: 'Numero de identicacion',prefixIcon: const Icon(Icons.person_pin_outlined),fillColor: Colors.white70),
        onChanged: (valor){
          setState(() {
            _cedula=(valor);
            //_cedula.toString();
          });
        },
      );
    
  }

  Widget nombre(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {return 'Ingrese su nombre';}},
      controller: text_clear2,
      keyboardType:TextInputType.text,
      maxLength: 8,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Nombre',labelText: 'Nombre',prefixIcon: const Icon(Icons.people),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _nombre=valor;
        });
      },
    );
  }


  Widget apellido(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {return 'Ingrese su apellido';}},
      controller: text_clear3,
      keyboardType:TextInputType.text,
      maxLength: 20,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Apellido',labelText: 'Apellido',prefixIcon: const Icon(Icons.people),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _apellido=valor;
        });
      },
    );
  }


  Widget edad(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {return 'Ingrese su edad';}},
      controller: text_clear4,
      keyboardType:TextInputType.number,
      maxLength: 2,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Edad',labelText: 'Edad',prefixIcon: const Icon(Icons.hourglass_top_outlined),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _edad=valor;
        });
      },
    );
  }

  Widget celular(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {return 'Ingrese su numero de celular';}},
      controller: text_clear5,
      keyboardType:TextInputType.number,
      maxLength: 10,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Numero celular',labelText: 'Numero celular',prefixIcon: const Icon(Icons.phone_android_rounded),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _celular=valor;
        });
      },
    );
  }


  Widget email(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || EmailValidator.validate(value)==false) {return 'Ingrese un email valido';}},
      controller: text_clear6,
      keyboardType:TextInputType.text,
      maxLength: 30,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Correo electronico',labelText: 'Correo electronico',prefixIcon: const Icon(Icons.email_rounded),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _email=valor;
          
        });
      },
    );
  }


  Widget guardar(){
    _edadS=_edad.toString();
    return Container(
      width: 40,
      height: 50,
      padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: RaisedButton.icon(
        label: Text('Guardar',style: TextStyle(color: Colors.white,fontSize: 20)),
        shape: StadiumBorder(),
        //minWidth: 200.0,
        //height: 50,
        autofocus:true,
        icon:Icon(Icons.save_alt,color: Colors.black87),
        color: Colors.green,
        onPressed: () async{
          
          if(_formKey.currentState!.validate() && EmailValidator.validate(_email) ){
               var a= await _registrar.guardar_usuario(_cedula, _nombre, _apellido, int.parse(_edad), _celular, _email);
              if(a.statusCode==200){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text('Se registro exitosamente'),
                          content: Text('Desea guardar un nuevo usuario ?'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                                _cedula=''; _nombre=''; _apellido=''; _edad=''; _celular=''; _email='';
                                text_clear1.clear();
                                text_clear2.clear();
                                text_clear3.clear();
                                text_clear4.clear();
                                text_clear5.clear();
                                text_clear6.clear();
                              },
                              child: Text('Aceptar'),
                            ),
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: LoginPage(), duration: Duration(milliseconds: 600)));
                                //Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginPage()));
                                },
                              child: Text('Cancelar'),
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
                          title: Text('Existen campos vacios'),
                          content: Text('Todos los campos deben ser diligenciados o email invalido'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {Navigator.pop(context);},
                              child: Text('Aceptar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
              }
        }, 
        
      ),
    );
  }
  

}