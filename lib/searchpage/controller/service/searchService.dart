import 'package:blackandwhite/homePage/model/songsuggestionmodel.dart';
import 'package:blackandwhite/searchpage/model/genremodel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'searchService.g.dart';

@RestApi(baseUrl: "https://apiblack.avbigbuddy.site/")
abstract class Searchservice {
  factory Searchservice(Dio dio, {String baseUrl}) = _Searchservice;
  
  @GET("api/v1/genres")
  Future<AllGenreModel> getGenre();
}