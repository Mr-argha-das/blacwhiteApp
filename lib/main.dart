import 'package:blackandwhite/homePage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main(){
  runApp(const ProviderScope(child: MainClass()));
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