import 'package:blackandwhite/homePage/view/allhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
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