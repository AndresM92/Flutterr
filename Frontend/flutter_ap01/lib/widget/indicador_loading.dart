import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class Indicador_loading extends StatefulWidget {

  @override
  State<Indicador_loading> createState() => _Indicador_loadingState();
}

class _Indicador_loadingState extends State<Indicador_loading> {
 
  @override
  Widget build(BuildContext context) { 
    return LoadingIndicator(
    indicatorType: Indicator. ballClipRotateMultiple, 
    colors: const [Colors.blueAccent],      
    strokeWidth: 6,                       
    pathBackgroundColor: Colors.white   
    );

  }

}