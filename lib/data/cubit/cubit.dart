import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/states.dart';
import 'package:news_app03/data/models/news_model.dart';
import 'package:news_app03/presentation/screens/business_screen.dart';
import 'package:news_app03/presentation/screens/science_screen.dart';
import 'package:news_app03/presentation/screens/sports_screen.dart';
import 'package:news_app03/shared/local/shared_perf_helper.dart';
import 'package:news_app03/shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit i(BuildContext context) => BlocProvider.of(context);

  final DioHelper _dioHelper = DioHelper();
  int currentIndex = 0;

  final SharedPrefHelper _sharedPrefHelper = SharedPrefHelper();

  bool isLightMode = true;

  void changeThemeMode(){
    isLightMode = !isLightMode;
    _sharedPrefHelper.saveData("isLightMode",isLightMode);
    emit(ChangeThemeModeState());
  }

  void getModeFromSharedPref(bool? isLight){
    isLightMode = isLight??true;
    emit(ChangeThemeModeState());
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  NewsModel? newsModel;
  NewsModel? businessModel;
  NewsModel? scienceModel;
  NewsModel? sportsModel;
  NewsModel? searchModel;

  final List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void getNews(String category) {
    print("category===>$category");
    emit(FetchDataLoadingState());
    _dioHelper.getData(path: "top-headlines", params: {
      "country": "us",
      "category": category,
      "apiKey": "92bbf26815824a50b13ecd59c853d6f3",
    }).then((value) {
      switch (category) {
        case "business":
          businessModel = NewsModel.fromjson(value.data);
          break;
        case "science":
          scienceModel = NewsModel.fromjson(value.data);
          break;
        default:
          sportsModel = NewsModel.fromjson(value.data);
      }
      emit(FetchDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(FetchDataFailedState());
    });
  }

  void search(String text) {
    emit(SearchLoadingState());
    _dioHelper.getData(path: "top-headlines", params: {
      "q": text,
      "apiKey": "92bbf26815824a50b13ecd59c853d6f3",
    }).then((value) {
      emit(SearchFailedState());
      searchModel = NewsModel.fromjson(value.data);
      emit(SearchFailedState());
    }).catchError((e) {
      print(e.toString());
    });
  }
}
