import 'package:blackandwhite/homePage/model/homeartistModel.dart';
import 'package:blackandwhite/homePage/model/homsetodayssongsmodel.dart';
import 'package:blackandwhite/homePage/model/songsuggestionmodel.dart';
import 'package:blackandwhite/homePage/model/testmodel.dart';
import 'package:blackandwhite/homePage/model/todaysBigestSongModel.dart';
import 'package:blackandwhite/homePage/model/userrecentplayedsong.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'apiservice.g.dart';

@RestApi(baseUrl: "https://apiblack.avbigbuddy.site/")
abstract class HomeSerive {
  factory HomeSerive(Dio dio, {String baseUrl}) = _HomeSerive;

  @GET("api/v1/artists-list?page=1&limit=8")
  Future<HomeArtistsModel> getArtists();
  @GET("api/v1/songs/?title=%20&page=2&page_size=10")
  Future<SongResponse> getSong();
  @GET("api/v1/random-songs?page=1&limit=10")
  Future<ToddaysBiggestModel> todaysRecent();
  @GET("api/v1/recommend_songs/123456?limit=15")
  Future<SuggestionSongsModel> getSuggestionSong();
  @GET("api/v1/add-song/user-history")
  Future<TestModel> addtouserHistory(
    @Query('userid') String userid,
    @Query('songid') String songid,
  );
  @GET("api/v1/user-song-history?userid=123456")
  Future<UsrRecentPlayedSong> userRecetnSong();
}
