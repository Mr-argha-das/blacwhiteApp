import 'package:blackandwhite/constant/mycolor.dart';
import 'package:blackandwhite/homePage/view/allhomepage.dart';
import 'package:blackandwhite/homePage/view/hitspage.dart';
import 'package:blackandwhite/homePage/view/musichomepage.dart';
import 'package:blackandwhite/searchpage/view/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> _pages= [AllHomePage(),MusicHomePage(), HitsHomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Set the height here
        child: Padding(
          padding:  EdgeInsets.only(top: 25),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color:profileButtonColor,
                    borderRadius: BorderRadius.circular(5000)
                  ),
                  child: Center(
                    child: Text("A", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),),
                  ),
                ),
                new SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      
                      pageIndex = 0;
                    });
                  },
                  child: Container(
                    height: 35,
                   
                    decoration: BoxDecoration(
                      color:pageIndex == 0? appbarButtonColor : backGroundColor,
                      borderRadius: BorderRadius.circular(5000),
                      border: Border.all(color:pageIndex == 0? backGroundColor : Colors.black , width: 1)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text("All", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),),
                      ),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Container(
                    height: 35,
                   
                    decoration: BoxDecoration(
                      color:pageIndex == 1? appbarButtonColor : backGroundColor,
                      borderRadius: BorderRadius.circular(5000),
                      border: Border.all(color:pageIndex == 1? backGroundColor : Colors.black , width: 1)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text("Music", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),),
                      ),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  child: Container(
                    height: 35,
                   
                    decoration: BoxDecoration(
                      color:pageIndex == 2? appbarButtonColor : backGroundColor,
                      borderRadius: BorderRadius.circular(5000),
                      border: Border.all(color:pageIndex == 2? backGroundColor : Colors.black , width: 1)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text("Hits", style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context) => SearchPage()));
              }, icon: const Icon(Icons.search_outlined, size: 28,)),
              const SizedBox(
                width: 10,
              ),
            ],
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: _pages[pageIndex],
    );
  }
}