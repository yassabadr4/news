import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';
import '../components/article_widget.dart';
class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key,}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  void initState() {
    if(AppCubit.i(context).sportsModel==null) {
      AppCubit.i(context).getNews("sports");
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if(state is FetchDataLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        return RefreshIndicator(
          onRefresh: ()async{
            AppCubit.i(context).getNews("sports");
          },
          child: ListView.separated(
            itemBuilder: (context, index) =>  ArticleWidget(data: AppCubit.i(context).sportsModel!.articles![index]),
            separatorBuilder:(context, index) =>   const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 1, color: Colors.black),
            ),
            itemCount:AppCubit.i(context).sportsModel!.articles!.length ,
          ),
        );
      },
    );
  }
}
