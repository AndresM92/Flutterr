import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:custom_route_transition_test/custom_route_transition_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap01/widget/fondo.dart';
import 'package:flutter_ap01/windows/productos.dart';
import 'package:page_transition/page_transition.dart';
import 'crear.dart';
import 'login.dart';


class MenuPage extends StatefulWidget {

  List data;
  MenuPage(this.data);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar( 
            backgroundColor: Colors.black,automaticallyImplyLeading: false,
            title: Text('Menu'),
          ),
          body: Center(
            child: Container( 
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10), 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87,),
                borderRadius: BorderRadius.circular(70)
                ),
              child: Column( 
                children: [
                  FadeInLeft(child: Container( 
                    padding: EdgeInsets.all(20.0), 
                    margin: EdgeInsets.all(15), 
                    alignment: Alignment.bottomCenter, 
                    child: Image.asset('images/inicio.png'), 
                    width:280
                    ),),
                  Container(
                    child: new ListView( 
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 15), 
                      shrinkWrap: true, 
                      children: [
                        _crear(),
                        Divider(),
                        _listar(),
                         Divider(),
                         _cerrarSesion(),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
      );
  }

 
 Widget _crear(){
    return MaterialButton(
      shape: StadiumBorder(),
      minWidth: 200.0,
      height: 60,
      autofocus:true,
      color: Colors.lightBlue.shade400,
      onPressed: (){
        Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: CrearPage(widget.data), duration: Duration(milliseconds: 600)));
        //Navigator.push(context, MaterialPageRoute(builder:(context)=>CrearPage(widget.data)));
      }, 
      child: Text('Crear Producto',style: TextStyle(color: Colors.white,fontSize: 20),)
    );
  }

  Widget _listar(){
    return MaterialButton(
      shape: StadiumBorder(),
      minWidth: 200.0,
      height: 60,
      autofocus:true,
      color: Colors.lightBlue.shade400,
      onPressed: (){
          Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: ProductPage(widget.data), duration: Duration(milliseconds: 600)));
          //Navigator.push(context, MaterialPageRoute(builder:(context)=>ProductPage(widget.data)));
      }, 
      child: Text('Listar Productos',style: TextStyle(color: Colors.white,fontSize: 20))
    );
  }

  Widget _cerrarSesion(){
    return MaterialButton(
      shape: StadiumBorder(),
      minWidth: 200.0,
      height: 40,
      autofocus:true,
      color: Colors.black87,
      onPressed: () async {
          showDialog(context: context,builder: (BuildContext context) {
                    return Bounce( child:Expanded(
                      child: AlertDialog(
                        title: Text('Cerrar sesion'),
                        content: Text('Esta seguro de cerrar esta sesion'),
                        actions: [
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: LoginPage(), duration: Duration(milliseconds: 600)));},
                              //Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginPage()));},
                            child: Text('Aceptar'),
                          ),
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () {Navigator.pop(context);},
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
  
                    ));
                  },
                );
         
      }, 
      child: Text('Cerrar sesion',style: TextStyle(color: Colors.white))
    );
  }



}