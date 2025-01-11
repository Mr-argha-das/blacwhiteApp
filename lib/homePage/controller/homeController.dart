
import 'package:blackandwhite/config/pretty.dio.dart';
import 'package:blackandwhite/homePage/controller/service/apiservice.dart';
import 'package:blackandwhite/homePage/model/homeartistModel.dart';
import 'package:blackandwhite/homePage/model/homsetodayssongsmodel.dart';
import 'package:blackandwhite/homePage/model/todaysBigestSongModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistListShuflle = FutureProvider<HomeArtistsModel>((ref) async {
 final homeSerive = HomeSerive(createDio());
 return homeSerive.getArtists();
});

final homeTodaysSongs = FutureProvider<ToddaysBiggestModel>((ref) async {
 final homeSerive = HomeSerive(createDio());
 return homeSerive.todaysRecent();
});