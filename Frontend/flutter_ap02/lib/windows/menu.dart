import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap02/services/services_controller.dart';
import 'package:flutter_ap02/windows/registro.dart';


class MenuPage extends StatefulWidget {

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) { 
        var list = Icons.list;
        return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.red,opacity: 3.0),
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text('Edison',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.black)),
              actions: [
                _menu(),
              ],
      ),   
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 400.0,
                      child:Image.asset('images/banner.jpg'),
                    ),
                    Divider(),

                    Container(
                      color: Colors.grey[300],
                      child:Column(
                        children:[
                          _enviar_documentos(),
                          Divider(),
                          _ver_documentos(),
                          Divider(),
                          _oficinas(),
                        ]
                      )
                    ),
                  ],
                ),
              )
    );
  }

  Widget _enviar_documentos(){
    return Card(
        margin:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          width: 350,
          height: 150,
          child: Column(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 10, 25, 0),
              title: Container(padding: EdgeInsets.all(20), child: Row( children: [Icon(Icons.description_rounded,color:Colors.blue[900],size: 35,),Text('Enviar Documentos',style:TextStyle(color:Colors.blue[900],fontSize: 20))],)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 50, width: 170, decoration: BoxDecoration( color: Colors.blue[900],border: Border.all(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(30.0)),child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder:(context)=>RegistroPage()));},
                      child:Wrap(
                        children:[
                          Text('Ingresar',style:TextStyle(color: Colors.white,fontSize: 20)),
                          Icon(Icons.arrow_forward,size: 25,color: Colors.white)
                          ]
                        )
                      )
                   /* RaisedButton.icon(
                      shape: StadiumBorder(),
                      // minWidth: 100,
                      //height: 45,
                      autofocus:true,
                      //color: Colors.green,
                      onPressed: (){
                      //Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: Registrar_usuario_Page(), duration: Duration(milliseconds: 600)));
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>Registrar_usuario_Page()));
                    }, 
                    icon:Icon(Icons.arrow_forward,size: 25,color: Colors.white), 
                    label: Text('Ingresar',style: TextStyle(color: Colors.white,fontSize: 18)),
                    // child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18),)
                      )*/
                    ],
                  ),
                ),
                ],
              )
              //trailing: Icon(Icons.home),
              ),
            ]
          ),
        )
      );
    
  }

    Widget _ver_documentos(){
    return Card(
        margin:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          width: 350,
          height: 150,
          child: Column(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 10, 25, 0),
              title: Container(padding: EdgeInsets.all(20), child: Row( children: [Icon(Icons.search,color:Colors.pink[700],size: 35,),Text('Ver documentos',style:TextStyle(color:Colors.pink[700],fontSize: 20))],)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container( height: 50, width: 170, decoration: BoxDecoration( color: Colors.pink[700],border: Border.all(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(30.0)),child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Text('Ingresar',style:TextStyle(color: Colors.white,fontSize: 20)),Icon(Icons.arrow_forward,size: 25,color: Colors.white,)],),),
                ],
              )
              //trailing: Icon(Icons.home),
              ),
            ]
          ),
        )
      );
    
  }

    Widget _oficinas(){
    return Card(
        margin:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          width: 350,
          height: 150,
          child: Column(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 10, 25, 0),
              title: Container(padding: EdgeInsets.all(20), child: Row( children: [Icon(Icons.location_on_outlined, color:Colors.indigo[900],size: 35,),Text('Oficinas',style:TextStyle(color:Colors.indigo[900],fontSize: 20))],)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container( height: 50, width: 170, decoration: BoxDecoration( color: Colors.indigo[900],border: Border.all(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(30.0)),child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Text('Ingresar',style:TextStyle(color: Colors.white,fontSize: 20)),Icon(Icons.arrow_forward,size: 25,color: Colors.white,)],),),
                ],
              )
              //trailing: Icon(Icons.home),
              ),
            ]
          ),
        )
      );
    
  }

  Widget _menu(){
    return PopupMenuButton<String>(
                 icon:Icon(Icons.notes,size: 45,),
                 elevation: 1,
                 color: Colors.black54,
                 onSelected: selectMenuItem,
                itemBuilder: (context) => [
                  menuItem(value: 'Menu principal', icon: Icons.list),
                  menuItem(value: 'Enviar documento', icon: Icons.send_and_archive),
                  menuItem(value: 'Ver documento', icon: Icons.picture_as_pdf),
                  menuItem(value: 'Ver oficinas', icon: Icons.place_outlined)
                  ],
                );
  }

  PopupMenuItem<String> menuItem({String? value, IconData? icon}) {
    return PopupMenuItem(
      height: 40,
      textStyle: TextStyle(color: Colors.white),
      value: value,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.green),
            Text(value!, style: const TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  void selectMenuItem(String value) {
    switch (value) {
      case 'Opcion 1':
        break;
    }
  }

}