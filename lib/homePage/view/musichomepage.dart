import 'package:blackandwhite/homePage/controller/homeController.dart';
import 'package:blackandwhite/homePage/view/allhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicHomePage extends ConsumerStatefulWidget {
  const MusicHomePage({super.key});

  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends ConsumerState<MusicHomePage> {
  @override
  Widget build(BuildContext context) {
    final artistsList = ref.watch(artistListShuflle);
    final todaysSongsList = ref.watch(homeTodaysSongs);
    final suggestionSongs = ref.watch(sugggestionsongs);
    final userRecentSong = ref.watch(userRecentPlayedSong);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  artistsList.when(
                      data: (snapshot) => MasonryGridView.count(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            itemBuilder: (context, index) {
                              return SongsTabs(
                                image: snapshot.data[index].image,
                                artistID: snapshot.data[index].id.oid,
                                artistName: snapshot.data[index].name,
                              );
                            },
                          ),
                      error: (err, stack) => SizedBox(),
                      loading: () => SizedBox()),
                 
                 
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
                  todaysSongsList.when(
                      data: (snapshot) => Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return SongsTabsDynamic(title: snapshot.data[index].song.title, image: snapshot.data[index].song.image, id: snapshot.data[index].song.id.oid, artistName: snapshot.data[index].artist.name,);
                                }),
                          ),
                      error: (err, stack) => SizedBox(),
                      loading: () => SizedBox()),
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
                  userRecentSong.when(
                      data: (snapshot) => Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return SongsTabsDynamic(
                                    title: snapshot.data[index].title,
                                    image: snapshot.data[index].image,
                                    id: snapshot.data[index].title,
                                    artistName:
                                        snapshot.data[index].artist.name,
                                  );
                                }),
                          ),
                      error: (err, stack) => SizedBox(),
                      loading: () => SizedBox()),
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
                  suggestionSongs.when(
                      data: (snapshot) => Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return SongsTabsDynamic(title: snapshot.data[index].title, image: snapshot.data[index].image, id: "", artistName: snapshot.data[index].artist.name,);
                                }),
                          ),
                      error: (err, stack) => SizedBox(),
                      loading: () => SizedBox()),
                ],
              ),
            )));
  }
}