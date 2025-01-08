import 'package:blackandwhite/constant/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({super.key});

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MasonryGridView.count(
                    itemCount: 8,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      return const SongsTabs();
                    },
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  
                  Container(
                    height: 192,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: backGroundColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(25, 0, 0, 0),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 60,
                            width: 176,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("aessts/imges/artistimage.png"))
                            ),
                          ),
                          Text(
                            "Want playlist made for you?",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          new SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Text(
                              "Tell us what artists you like, and we’ll help you discover more music you might enjoy",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          new SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 35,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(500)),
                            child: Center(
                              child: Text(
                                "Chose Artists",
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today’s biggest hits", style: GoogleFonts.inter(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  new SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return SongsTabsDynamic();
                      }),
                  ),
                  new SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Recents", style: GoogleFonts.inter(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  new SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return SongsTabsDynamic();
                      }),
                  ),
                  new SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("More of what you like", style: GoogleFonts.inter(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  new SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return SongsTabsDynamic();
                      }),
                  ),
                ],
              ),
            )));
  }
}

class SongsTabs extends StatefulWidget {
  const SongsTabs({super.key});

  @override
  State<SongsTabs> createState() => _SongsTabsState();
}

class _SongsTabsState extends State<SongsTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7)),
                image: DecorationImage(
                    image: AssetImage('aessts/imges/anuvjain.png'),
                    fit: BoxFit.cover)),
          ),
          new SizedBox(
            width: 15,
          ),
          Text(
            "Anuv Jain",
            style: GoogleFonts.inter(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}


class SongsTabsDynamic extends StatefulWidget {
  const SongsTabsDynamic({super.key});

  @override
  State<SongsTabsDynamic> createState() => _SongsTabsDynamicState();
}

class _SongsTabsDynamicState extends State<SongsTabsDynamic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135 ,
            width: 135,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(image: AssetImage("aessts/imges/frame.png"), fit: BoxFit.cover)
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text("Jo Tum Mere Ho", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
          
          Text("Anuv jain", style: TextStyle(color: Colors.black, fontSize: 12,),),
        ],
      ),
    );
  }
}