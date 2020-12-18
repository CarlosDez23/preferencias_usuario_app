import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/widgets/drawer_menu.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    prefs.lastScreenVisited = SettingsPage.routeName;
    _textController = new TextEditingController(text: prefs.nombre);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }

  //Guardamos en el shared preferences
  void _setSelectedRadio(int valor) {
    prefs.genero = valor;
    setState(() {
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.colorSecundario)
          ? Colors.teal
          : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (bool value){
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero,
            //No hace falta ponerle el argumento al método porque lo que emite el onchanged
            //automáticamente pasa como argumento al método 
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: (String value){ 
                prefs.nombre = value;
              }
            )
          ),
        ],
      ), 
    );
  }
}