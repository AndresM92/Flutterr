import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_ap01/app.dart';
import 'package:flutter_ap01/widget/indicador_loading.dart';
import 'package:flutter_ap01/windows/login.dart';
import 'package:flutter_ap01/services/provider_data.dart';
import 'package:flutter_ap01/windows/registrar_usuario.dart';
import 'package:loading_indicator/loading_indicator.dart';


class LoadingPage extends StatefulWidget {

  @override
  State<LoadingPage> createState() => _LoadingPageState();
  
}

class _LoadingPageState extends State<LoadingPage> {

  double _cont2= 0;
  final int _d2=2;
  
  
  void _star_log() {
    
     Future.delayed(Duration(seconds: 6), (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), 
        (_) => false
      );
      }
    );
    new Timer.periodic(Duration(seconds: _d2), (timer){
      setState(() {
        if (_cont2==_d2){
          timer.cancel();
         }else{
          _cont2+=0.2;
          }
         }
        );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
        _star_log();
        return SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  
                Indicador_loading(),
          ],
        )
      ),
    );
  }
}
