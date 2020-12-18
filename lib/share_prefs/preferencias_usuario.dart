import 'package:preferencias_usuario_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  //Singleton
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Get y sets de los elementos que vamos a guardar
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String newName){
    _prefs.setString('nombre', newName);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  get lastScreenVisited {
    return _prefs.getString('lastScreen') ?? HomePage.routeName;
  }

  set lastScreenVisited(String screenName){
    _prefs.setString('lastScreen', screenName);
  }

}