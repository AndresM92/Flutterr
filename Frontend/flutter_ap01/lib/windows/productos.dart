import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class ProductPage extends StatefulWidget {

  List data;

  ProductPage(this.data);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
            appBar: AppBar( 
              
            automaticallyImplyLeading: true,
            backgroundColor: Colors.black,
            title: Text('Listado Productos'),
          ),
          body:Container(
            child: GridView.count(
              crossAxisCount:1,
              semanticChildCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5,
              children: widget.data.map((a){

                return Padding(
                  padding: const EdgeInsets.all(10.10),
                  child: Container(
                    width: 220,
                    height: 220,
                    alignment:Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage( a['p_imagen']),//AssetImage(a['p_imagen'])
                        fit: BoxFit.cover
                        ),
                      border: Border.all(color: Colors.black87,),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    child: SingleChildScrollView(child: Container(
                      color:Colors.black45.withOpacity(1),
                      padding: EdgeInsets.all(15),
                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                        children: [
                          
                          Text('${a['p_nombre']} \n Precio:${a['p_precio']}',style: TextStyle(color:Colors.white),textAlign: TextAlign.center),
                          
                          _eliminar(a),
                        ],
                      )
                    ),)
                  ),
                );
              }).toList(),
      ),
     ),
   );
  }

  Widget _eliminar(Map <String,String> b){
    return IconButton(
      autofocus:true,
      color: Colors.red,
      icon: Icon(Icons.delete),
      
      onPressed: (){
        
         // Navigator.push(context, MaterialPageRoute(builder:(context)=>ProductPage(data)));
        
          showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Expanded(
                      child: AlertDialog(
                        title: Text('Seleccione una opcion'),
                        content: Text('Desea Eliminar este producto'),
                        actions: [
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () { 
                              //widget.data.remove(b);
                              //List data2=widget.data;

                              Navigator.pop(context);
                              setState(() {
                                widget.data.remove(b);
                              });
                              //Navigator.pushNamed(context,);
                              },
                            child: Text('Aceptar'),
                          ),
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () { Navigator.pop(context);},
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
  
                    );
                  },
          );
      }, 
      
    );
  }



}


