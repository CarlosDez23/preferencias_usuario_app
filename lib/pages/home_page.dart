import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/widgets/drawer_menu.dart';

class HomePage extends StatelessWidget {

  //Otra forma de utilizar las rutas
  static final String routeName = 'home';
  //Preferencias de usuario
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    //Lo tenemos en cada página así siempre se queda con la última visitada
    prefs.lastScreenVisited = routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) 
          ? Colors.teal
          : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero} '),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre} '),
          Divider(),
        ],
      ) 
    );
  }
}