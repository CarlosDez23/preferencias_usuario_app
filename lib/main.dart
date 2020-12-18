import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/pages/home_page.dart';
import 'package:preferencias_usuario_app/pages/settings_page.dart';
import 'package:preferencias_usuario_app/share_prefs/preferencias_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.lastScreenVisited,
      routes: {
        HomePage.routeName      : (BuildContext context) => HomePage(),
        SettingsPage.routeName  : (BuildContext context) => SettingsPage(),
      },
    );
  }
}