import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _usuario = '';
  String _contrasena = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login aplicación'),
      ),
      body: _crearLogin(),
    );
  }

  Widget _crearLogin() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _user(),
          _password(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Iniciar sesión'),
            onPressed: _iniciarSesion,
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Registrarse'),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _user() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Usuario',
          icon: Icon(Icons.accessibility_new),
        ),
        onChanged: (valor) {
          _usuario = valor;
        },
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Contraseña',
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) {
          _contrasena = valor;
        },
      ),
    );
  }

  void _iniciarSesion() {
    if (_contrasena == '123456' && _usuario == 'Scarkov') {
      Navigator.pushNamed(context, 'grid');
    } else {
      _mostrarMensaje(
          titulo: 'Error de inicio de sesión',
          mensaje: 'Usuario o contraseña erróneos');
    }
  }

  void _mostrarMensaje({String titulo, String mensaje}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(titulo),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mensaje),
              ],
            ),
            actions: <Widget>[
              Center(
                child: FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}
