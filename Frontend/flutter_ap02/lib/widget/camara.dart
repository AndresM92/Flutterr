import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ap02/services/services_controller.dart';
import 'package:image_picker/image_picker.dart';


class Camara extends StatefulWidget {
  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  
  final _picker = ImagePicker();
  File? imageFile;
  late String a;
  final aa=Services_Controller();
  

  _openGallery (BuildContext context) async {
    
    var picture= await _picker.getImage(source: ImageSource.gallery);
    this.setState((){
      imageFile=File(picture!.path);
    });
    var x=await aa.registrar('2', '2', '2', '2', '2', '2', '2', '2', '2');
      print('------------------'+x.statusCode.toString()+'+++++++++++++++++++++++++++');
    Navigator.of(context).pop();
    
  }

  _openCamera(BuildContext context) async {
     var picture= await _picker.getImage(source: ImageSource.camera);
    this.setState((){
      imageFile=File(picture!.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Seleccione"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galeria"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0),),
                  GestureDetector(
                    child: Text("Camara"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
  //retorna  texto si no se ha seleccionado alguna imagen
  Widget _decideImageView(){
    if(imageFile==null){
      return new RawMaterialButton(
              onPressed: () {_showChoiceDialog(context);},
              child: new Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.red[600],
                  size: 60.0,
              ),
      );
    }
    else{
      a=base64Encode(imageFile!.readAsBytesSync());
      //print(a);
      //aa.registrar('2', '2', '2', '2', '2', '2', '2', '2', '2');
      return Image.file(File(imageFile!.path),width: 200, height: 200);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
             /* RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                //child: Text("Selecciona la Imagen"),
              )*/
            ],
          ),
        ),
      );

  }
}


  Widget _camara(){
    return Container(
  
      padding: EdgeInsets.all(0.0),
      child: new RawMaterialButton(
              onPressed: () {print("object");},
              child: new Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.red[600],
                  size: 60.0,
              ),
      ),
    );
  }