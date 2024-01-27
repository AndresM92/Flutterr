import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';

class FondoPage extends StatefulWidget {

  @override
  State<FondoPage> createState() => _FondoPageState();
}

class _FondoPageState extends State<FondoPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
        behaviour: SpaceBehaviour(),
        vsync: this,
        child: Text('Hello'),
        );
    
  }
}