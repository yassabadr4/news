import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';
import '../components/article_widget.dart';
class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key,}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    if(AppCubit.i(context).businessModel==null) {
      AppCubit.i(context).getNews("business");
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
           AppCubit.i(context).getNews("business");
         },
         child: Column(
           children: [
             if(AppCubit.i(context).businessModel!=null)
             Expanded(
               child: ListView.separated(
                  itemBuilder: (context, index) =>  ArticleWidget(data: AppCubit.i(context).businessModel!.articles![index]),
                  separatorBuilder:(context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(height: 1, color: Colors.black),
                  ),
                  itemCount:AppCubit.i(context).businessModel!.articles!.length ,
                ),
             ),
           ],
         ),
       );
      },
    );
  }
}
