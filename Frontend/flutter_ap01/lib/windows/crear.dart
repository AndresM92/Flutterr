import 'dart:math';
import 'package:custom_route_transition_test/custom_route_transition_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap01/widget/camara.dart';
import 'package:flutter_ap01/widget/indicador_loading.dart';
import 'package:flutter_ap01/windows/login.dart';
import 'package:flutter_ap01/windows/menu.dart';
import 'package:flutter_ap01/services/provider_data.dart';
import 'package:page_transition/page_transition.dart';
import 'menu.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class CrearPage extends StatefulWidget {

  List data;
  CrearPage(this.data);

  @override
  State<CrearPage> createState() => _CrearPageState();
}

class _CrearPageState extends State<CrearPage> {
  

  String _n='';
  String _pre='';
  final img=Provider_Data();  
  late int cont=2;
  String i='';
  bool t=false;
  final _moneda = new MaskedTextController(mask: '000.000.000.000');
  final _pesos = new MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.',leftSymbol: '\$ ');
  final text_clear1 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    
      /*if (t==false){
        var k = Random();
         cont = k.nextInt(7);
         t=true;
        }*/
        return Scaffold(
           resizeToAvoidBottomInset: false,
            appBar: AppBar( backgroundColor: Colors.black,
            title: Text('Crear Producto'),
          ),
          body: Center(
            child: Container( 
              width: 380,
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10), 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87,),
                borderRadius: BorderRadius.circular(70)
              ),
              child:SingleChildScrollView(child: Column( 
                children: [
                  Container( 
                    width: 320,
                    height: 320,
                    margin: EdgeInsets.all(8), 
                    alignment: Alignment.bottomCenter, 
                    padding: EdgeInsets.all(5), 
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87,),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    //child: Camara(),
                      child: FutureBuilder(future:img.cargar_api(),builder: (context,AsyncSnapshot<List<dynamic>> snapshot){ if (snapshot.hasData){i=snapshot.data![cont]; return Image.network(snapshot.data![cont],width:400 ,height:400 ,); } return Indicador_loading();}),//Image.asset("imagenes/"+(cont).toString()+".jpg"),
                  ),
                  Container(
                    child: new ListView( 
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 15), 
                      shrinkWrap: true, 
                      children: [
                        _nombre(),
                        Divider(),
                        _precio(),
                         Divider(),
                        _guardar(cont),
                        ],
                      ),
                  ),
                ],
              ),)
            ),
          ),
      );
  }

  Widget _nombre(){
    return TextField(
      controller: text_clear1,
      keyboardType: TextInputType.text,
      maxLength: 15,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Nombre',labelText: 'Nombre',prefixIcon: const Icon(Icons.account_box_outlined),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
          _n=valor;
        });
      },
    );
  }

   Widget _precio(){
    return TextField(
      controller: _pesos,
      keyboardType: TextInputType.number,
      maxLength: 15,
      textAlign: TextAlign.center,
      autofocus: true,
      decoration: new InputDecoration(enabledBorder:new OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),borderSide: new BorderSide(color: Colors.black54,width: 3)),hintText: 'Precio',labelText: 'Precio',prefixIcon: const Icon(Icons.monetization_on_outlined),fillColor: Colors.white70),
      onChanged: (valor){
        setState(() {
           _pre=(valor);
         // _pesos.updateValue(_pre);
          _pre.toString();
          //_moneda.updateText(_pre);
         // _p=_pre;
          //print(_pre);
        });
      },
    );
  
  }

  Widget _guardar(int a){
    
    return MaterialButton(
      shape: StadiumBorder(),
      minWidth: 40.0,
      height: 40,
      autofocus:true,
      color: Colors.green,
      onPressed: (){
        if (_n.isNotEmpty && _pre.isNotEmpty){
          String _p;
         // _moneda.updateText(_pre);
          //_pesos.updateValue(double.parse(_pre));
          _p=_pesos.text;
          
          widget.data.add({"p_nombre": _n, "p_precio": _p, "p_imagen": i });//"imagenes/"+(a).toString()+".jpg"
          _n='';_pre='';cont=0;t=false;_pesos.updateValue(0);
        //RouteTransition(context,child: MenuPage(widget.data),type: AnimationType.scale,replacement: false,duration: Duration(milliseconds: 600),);
          showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text('Se registro exitosamente'),
                          content: Text('Desea guardar un nuevo producto ?'),
                          actions: [
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                                text_clear1.clear();
                              },
                              child: Text('Aceptar'),
                            ),
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: CrearPage(widget.data), duration: Duration(milliseconds: 600)));
                                //Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginPage()));
                                },
                              child: Text('Cancelar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
        }else{
          showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Expanded(
                      child: AlertDialog(
                        title: Text('Campos vacios'),
                        content: Text('Hay uno o mas campos vacios'),
                        actions: [
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () { Navigator.pop(context);},
                            child: Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  },
                );
        } 
      }, 
      child: Text('Guardar Producto',style: TextStyle(color: Colors.white,fontSize: 20))
    );
  }

}