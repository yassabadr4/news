import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';
import '../components/article_widget.dart';
class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key,}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  void initState() {
    if(AppCubit.i(context).scienceModel==null) {
      AppCubit.i(context).getNews("science");
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
            AppCubit.i(context).getNews("science");
          },
          child: ListView.separated(
            itemBuilder: (context, index) =>  ArticleWidget(data: AppCubit.i(context).scienceModel!.articles![index]),
            separatorBuilder:(context, index) =>  const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 1, color: Colors.black),
            ),
            itemCount:AppCubit.i(context).scienceModel!.articles!.length ,
          ),
        );
      },
    );
  }
}
