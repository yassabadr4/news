import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';

import '../components/article_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
       return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell( onTap: (){
                        AppCubit.i(context).searchModel=null;
                        Navigator.pop(context);
                      },
                          child: const Icon(Icons.arrow_back_ios,color: Colors.grey,)
                      ),

                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: (val){
                            AppCubit.i(context).search(val);
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            label: Text(
                                "Search"
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if(AppCubit.i(context).searchModel!= null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                      child: ListView.separated(
                        itemBuilder: (context, index) =>  ArticleWidget(data: AppCubit.i(context).searchModel!.articles![index]),
                        separatorBuilder:(context, index) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(height: 1, color: Colors.black),
                        ),
                        itemCount:AppCubit.i(context).searchModel!.articles!.length ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
