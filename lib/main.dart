import 'package:actividad_audraw/Screens/Pantalla1Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla2Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla3Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicios02App());
}

class Ejercicios02App extends StatelessWidget {
  const Ejercicios02App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EJERCICIOS-04"),
        actions: [
          IconButton(
            onPressed: () => mensajesCreditos(context),
            icon: Icon(Icons.text_snippet),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/22575.png"),
          ),
        ),
        child: Center(
          child: Text(
            "WELCOME",
            style: TextStyle(
              color: Color.fromRGBO(6, 238, 84, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Menú de Ejercicios",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Selecciona una opción",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.green),
                title: Text("Ejercicio 01"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla1()),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.orange),
                title: Text("Ejercicio 02"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla2()),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.purple),
                title: Text("Ejercicio 03"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla3()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void mensajesCreditos(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Ejercicios de Programación"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Programador: Isaac Tonato"),
          SizedBox(height: 4),
          Text("Carrera: Desarrollo de Software"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cerrar"),
        )
      ],
    ),
  );
}
