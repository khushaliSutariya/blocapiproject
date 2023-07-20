import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/movie_list.dart';
import '../../resources/URLResources.dart';
import 'package:http/http.dart' as http;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(allMoviedSerchData: List.empty(),searchController: TextEditingController() )) {
    searchMovie(state.searchController.text);
  }

  searchMovie(String searchController) async {
    final queryParameters = {
      'api_key': URLResources.apiKey,
      'query': searchController
    };
    Uri url = Uri.parse(URLResources.searchMovie)
        .replace(queryParameters: queryParameters);
    var response = await http.get(url);
    print("url :: $url");
    print("response :${response.body}");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      emit(state.copyWith(allMoviedSerchData: json["results"]
          .map<MovieList>((obj) => MovieList.fromJson(obj))
          .toList()));
    } else {
      print("error");
    }
  }
}
