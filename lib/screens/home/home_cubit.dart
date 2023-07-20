
import 'dart:convert';

import 'package:bloc/bloc.dart';

import '../../models/movie_list.dart';
import '../../resources/URLResources.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(allMovieDataList:List.empty())){movieListData();}

  movieListData() async {
    final queryParameters = {'api_key': URLResources.apiKey};
    Uri url = Uri.parse(URLResources.movieUrl).replace(queryParameters: queryParameters);
    var response = await http.get(url);
    print("url :: $url");
    print("response :${response.request}");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      emit(HomeState(allMovieDataList: json["results"].map<MovieList>((obj) => MovieList.fromJson(obj)).toList()));

    } else {
      print("error");
    }
  }



}
