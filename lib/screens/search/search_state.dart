part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<MovieList> allMoviedSerchData;
  final TextEditingController searchController;


  SearchState({
    required this.allMoviedSerchData,
    required this.searchController,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [allMoviedSerchData];

  SearchState copyWith({
    List<MovieList>? allMoviedSerchData,
    TextEditingController? searchController,
  }) {
    return SearchState(
      allMoviedSerchData: allMoviedSerchData ?? this.allMoviedSerchData,
      searchController: searchController ?? this.searchController,
    );
  }
}
