import 'package:blackandwhite/homePage/view/homepage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
        child: HomePage(),
      ),
    );
  }
}