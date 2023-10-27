import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
 static SharedPreferences? _sharedPreferences;

  static Future <void> init()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool?>saveData(String key, bool value)async{
    try{
      return await _sharedPreferences?.setBool(key, value);
    } catch(e){
      print(e.toString());
      return null;
    }

  }

  getData(String key)async{
   try{
     final data =  _sharedPreferences?.get(key);
     print(data);
     return data;
   } catch(e){
     print(e.toString());
   }

 }
}