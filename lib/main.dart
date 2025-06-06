
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
      appBar: AppBar(title: Text("DRAWER"),),
      body: Container(
        decoration:BoxDecoration(
         // image:DecorationImage(
           // fit: BoxFit.cover,
           // image: AssetImage("assets/images/fondo.jpg"))
          ),
        child: Center(child: Text("WELCOME-DRAWER", style:TextStyle(color: Color.fromRGBO(6, 238, 84, 1),) ))),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Pantalla1"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla1())),

            ),
            ListTile(
              title: Text("Pantalla 2"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla2())),
            ),
            ListTile(
              title: Text("pantalla 3"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla3())),
            )
          ],
        ),
      ),
    );
  }
}