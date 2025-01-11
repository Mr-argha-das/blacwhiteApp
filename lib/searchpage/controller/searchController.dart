

import 'package:blackandwhite/config/pretty.dio.dart';
import 'package:blackandwhite/homePage/model/homeartistModel.dart';
import 'package:blackandwhite/searchpage/controller/service/searchService.dart';
import 'package:blackandwhite/searchpage/model/genremodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreTypes = FutureProvider<AllGenreModel>((ref) async {
 final searchservice = Searchservice(createDio());
 return searchservice.getGenre();
});