import 'package:blocapiproject/screens/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit,SearchState>(builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              cursorColor: Colors.black,
              controller: state.searchController,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) async {
               await BlocProvider.of<SearchCubit>(context).searchMovie(state.searchController.text);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search, color: Colors.black),
                fillColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            Expanded(child: (state.allMoviedSerchData.isNotEmpty)?ListView.builder(
              itemCount: state.allMoviedSerchData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      "Title: ${state.allMoviedSerchData[index].originalTitle}",),
                  ],
                );
                },):const Center(child: CircularProgressIndicator(),)
            )
          ],
        );

      },),

    );
  }
}
