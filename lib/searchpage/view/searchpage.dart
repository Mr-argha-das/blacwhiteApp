import 'package:blackandwhite/constant/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Set the height here
        child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: profileButtonColor,
                      borderRadius: BorderRadius.circular(5000)),
                  child: Center(
                    child: Text(
                      "A",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 13,
                ),
                Text(
                  "Search",
                  style: GoogleFonts.inter(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 28,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: "What do you want to listen to?",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Start Browsing",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MasonryGridView.count(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return  StartBrowsingTab(backGroundColorColor: Color(0xFFFF82E6),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StartBrowsingTab extends StatefulWidget {
  final Color backGroundColorColor;
  const StartBrowsingTab({super.key, required this.backGroundColorColor});

  @override
  State<StartBrowsingTab> createState() => _StartBrowsingTabState();
}

class _StartBrowsingTabState extends State<StartBrowsingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      height: 61,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: widget.backGroundColorColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 9,
            top: 8,
            child: SizedBox(
              width: 103,
              child: Text(
                'Music',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 18,

                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.90,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width /2.9,
            top: 19,
            child: Container(
              width: 46,
              height: 42,
              decoration: ShapeDecoration(
                color: widget.backGroundColorColor,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(120), bottomRight: Radius.circular(38)),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 24,
                    offset: Offset(-4, -4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
