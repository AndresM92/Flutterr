import 'package:flutter/material.dart';
import 'package:flutter_ap02/windows/login.dart';
import 'package:flutter_ap02/windows/menu.dart';
import 'package:flutter_ap02/windows/registro.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage()
    );
  }
}