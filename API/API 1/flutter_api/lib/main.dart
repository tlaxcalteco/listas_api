import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> _personas = [
    Persona("Jose", "Gomez", "43455535453"),
    Persona("Juan", "Perez", "43455535453"),
    Persona("Pedro", "Martinez", "43455535453"),
    Persona("Maria", "Gomez", "43455535453"),
    Persona("Jose", "Gomez", "43455535453"),
    Persona("Juan", "Perez", "43455535453"),
    Persona("Pedro", "Martinez", "43455535453"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    this._borrarPersona(context, _personas[index]);
                  },
                  title: Text(_personas[index].nombre +
                      " " +
                      _personas[index].apellido),
                  subtitle: Text(_personas[index].telefono),
                  leading: CircleAvatar(
                    child: Text(_personas[index].nombre.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _borrarPersona(context, persona) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Eliminar"),
            content: Text("¿Esta seguro de eliminar a ${persona.nombre}?"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  "Aceptar",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  setState(() {
                    _personas.remove(persona);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class Persona {
  String nombre;
  String apellido;
  String telefono;

  Persona(this.nombre, this.apellido, this.telefono);
}
