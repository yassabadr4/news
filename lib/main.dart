import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';
import 'package:news_app03/shared/local/app_theme.dart';
import 'package:news_app03/shared/local/shared_perf_helper.dart';
import 'package:news_app03/shared/network/dio_helper.dart';
import 'presentation/screens/layout_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefHelper.init();
  DioHelper.init();
  final SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  final bool? isLight= await sharedPrefHelper.getData("isLightMode");
  runApp(MyApp(
    appTheme: AppTheme(),
    isLight: isLight,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appTheme,this.isLight});
  final AppTheme? appTheme;
  final bool? isLight;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..getModeFromSharedPref(isLight),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) => MaterialApp(
            title: 'Flutter Demo',
            theme: appTheme?.getTheme(false),
            darkTheme:appTheme?.getTheme(true),
            themeMode: AppCubit.i(context).isLightMode ?ThemeMode.light:ThemeMode.dark,
            home: LayoutScreen(),
            debugShowCheckedModeBanner: false,
          ), 
      ),
    );
  }
}

