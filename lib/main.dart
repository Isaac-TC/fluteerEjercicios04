
import 'package:actividad_audraw/Screens/Pantalla1Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla2Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla3Screen.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(Ejercicios02App());
  }
  class Ejercicios02App extends StatelessWidget {
  const Ejercicios02App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}
class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJERCICIOS-04"),),
      body: Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/22575.png"))
          ),
        child: Center(child: Text("WELCOME", style:TextStyle(color: Color.fromRGBO(6, 238, 84, 1),) ))),
      drawer: Drawer(
  child: Container(
    color: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
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