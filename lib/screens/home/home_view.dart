import 'package:blocapiproject/screens/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../search/search_cubit.dart';
import '../search/search_cubit.dart';
import 'home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if(state.allMovieDataList.isNotEmpty){
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                        itemCount: state.allMovieDataList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(children: [
                                Text(
                          "Title: ${state.allMovieDataList[index].originalTitle.toString()}",
                          ),
                            ],)

                            ],
                          );
                        },
                      ),
                  );
                }
                else{
                    return const Center(child: CircularProgressIndicator(),
                    );
                }
                },
            ),
          ElevatedButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BlocProvider<SearchCubit>(
              create: (context) => SearchCubit(),
              child: const SearchView()),)),
              child: Text("Search")),

        ],
      ),


    );
  }
}
