import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap02/services/services_controller.dart';
import 'package:flutter_ap02/widget/camara.dart';


class RegistroPage extends StatefulWidget {

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

    var _t=['CC','TI','CE','gfjhfghfjhj'];
    late  String? _d='Tipo de documento';

    var _ciu=['Pereira','Medellin','Bogota','Cali'];
    late  String? _c='Ciudad';

    var _adj=['PDF','Docx','txt'];
    late  String? _ad='Tipo adjunto';

  @override
  Widget build(BuildContext context) { 

      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 120.0,
          leading: TextButton.icon(onPressed:() {Navigator.pop(context);}, icon:  Icon(Icons.arrow_back_ios), label: Text("Regresar"),),
          backgroundColor: Colors.white,),

        body: Container(
            child: new ListView(
              children: [
                _text(),
                Divider(),
                Camara(),
                Divider(),
                Container(
                 // padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: Column(
                    children: [
                      _tdocumento(),
                      Divider(),
                      _ndocumento(),
                      Divider(),
                      _nombre(),
                      Divider(),
                      _apellido(),
                      Divider(),
                      _correo(),
                      Divider(),
                      _ciudad(),
                      Divider(),
                      _adjunto(),
                      Divider(),
                      _documento(),
                      Divider(),
                      _enviar()
                    ],
                  ),
                ),
              ],
            ),
        ),

      );
  }

  Widget _text(){
    return Container(
      padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
      child: Text(
        'Envío de Documentación',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
      ),
    );
  }

 /* Widget _camara(){
    return Container(
      width: 100,
      height: 200,
      padding: EdgeInsets.all(0.0),
      child: new RawMaterialButton(
              onPressed: () {print("object");},
              child: new Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.red[600],
                  size: 60.0,
              ),
            //shape: new CircleBorder(),
            //elevation: 2.0,
            //fillColor: Colors.black,
            //padding: const EdgeInsets.all(15.0),
      ),
    );
  }*/

  
  Widget _tdocumento(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 170, 0),
      child: DropdownButton(
        isExpanded: true,
        items: _t.map((String a){
          return DropdownMenuItem(value:a,child: Text(a));
        },).toList(),
        onChanged: (_value)=>{
          setState((){
            _d=_value as String?;
          })
        },
      hint: Text(_d!), 
      style:TextStyle(color:Colors.black, fontSize: 16),
      elevation: 8,
      
      disabledHint:Text("Disabled"),
      icon: Icon(Icons.arrow_drop_down_circle),
      ),
    );

  }

  Widget _ndocumento(){
    return Container(
      //padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
      child: TextFormField(
      keyboardType:TextInputType.text,
      //maxLength: 30,
      textAlign: TextAlign.left,
      autofocus: true,
      decoration: new InputDecoration(hintText: 'Numero de documento',prefixIcon: const Icon(Icons.description),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
         var _nd=valor as String;
        });
      },
      )
    );

  }


  Widget _nombre(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
      keyboardType:TextInputType.text,
      //maxLength: 30,
      textAlign: TextAlign.left,
      autofocus: true,
      decoration: new InputDecoration(hintText: 'Nombre',fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
         // _email=valor; 
        });
      },
      )
    );

  }

  Widget _apellido(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
      keyboardType:TextInputType.text,
      //maxLength: 30,
      textAlign: TextAlign.left,
      autofocus: true,
      decoration: new InputDecoration(hintText: 'Apellido',fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
         // _email=valor; 
        });
      },
      )
    );

  }

  Widget _correo(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
      keyboardType:TextInputType.text,
      //maxLength: 30,
      textAlign: TextAlign.left,
      autofocus: true,
      decoration: new InputDecoration(hintText: 'Correo',fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
         // _email=valor; 
        });
      },
      )
    );

  }

  Widget _ciudad(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 170, 0),
      child: DropdownButton(
        isExpanded: true,
        items: _ciu.map((String a){
          return DropdownMenuItem(value:a,child: Text(a));
        },).toList(),
        onChanged: (_value)=>{
          setState((){
            _c=_value as String?;
          })
        },
      hint: Text(_c!), 
      style:TextStyle(color:Colors.black, fontSize: 16),
      elevation: 8,
      disabledHint:Text("Disabled"),
      icon: Icon(Icons.arrow_drop_down_circle),
      ),
    );

  }

  Widget _adjunto(){

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 170, 0),
      child: DropdownButton(
        isExpanded: true,
        items: _adj.map((String a){
          return DropdownMenuItem(value:a,child: Text(a));
        },).toList(),
        onChanged: (_value)=>{
          setState((){
            _ad=_value as String?;
          })
        },
      hint: Text(_ad!), 
      style:TextStyle(color:Colors.black, fontSize: 16),
      elevation: 8,
      disabledHint:Text("Disabled"),
      icon: Icon(Icons.arrow_drop_down_circle),
      ),
    );

  }

  Widget _documento(){
    return Container(
      //width: 40,
      //height: 50,
      padding:EdgeInsets.fromLTRB(0, 0, 150, 0),
      child: RaisedButton.icon(
        shape: StadiumBorder(),
       // minWidth: 100,
        //height: 45,
        autofocus:true,
        color: Colors.pink[800],
        onPressed: (){
          //Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: Registrar_usuario_Page(), duration: Duration(milliseconds: 600)));
          //Navigator.push(context, MaterialPageRoute(builder:(context)=>Registrar_usuario_Page()));
        }, 
        icon:Icon(Icons.list_alt_outlined,color: Colors.white), 
        label: Text('Documento',style: TextStyle(color: Colors.white,fontSize: 18)),
       // child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18),)
      )
    );
  }

  Widget _enviar(){
    return  Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          shape: StadiumBorder(),
         // minWidth: 100,
          //height: 45,
          autofocus:true,
          color: Colors.red[800],
          onPressed: (){
            //Navigator.push(context,  PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: Registrar_usuario_Page(), duration: Duration(milliseconds: 600)));
            //Navigator.push(context, MaterialPageRoute(builder:(context)=>Registrar_usuario_Page()));
          }, 
          //icon:Icon(Icons.list_alt_outlined), 
          child: Text('Enviar',style: TextStyle(color: Colors.white,fontSize: 18)),
         // child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 18),)
        ),
    );
  }

}