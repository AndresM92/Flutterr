import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Camara extends StatefulWidget {
  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  
  final _picker = ImagePicker();
  PickedFile? imageFile;
  

  _openGallery (BuildContext context) async {
    
      var picture= await _picker.getImage(source: ImageSource.gallery);
    this.setState((){
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
     var picture= await _picker.getImage(source: ImageSource.camera);
    this.setState((){
      imageFile=picture ;
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
      return Text("No se ha seleccionado una imagen");
    }
    else{
      return Image.file(File(imageFile!.path),width: 100, height: 100);
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
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Selecciona la Imagen"),
              )
            ],
          ),
        ),
      );

  }
}