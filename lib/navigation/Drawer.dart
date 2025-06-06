import 'package:actividad_audraw/Screens/Pantalla1Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla2Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla3Screen.dart';
import 'package:actividad_audraw/main.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end, // Pega todo abajo
                children: [
                  Text(
                    "Menú de Ejercicios",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Selecciona un ejercicio",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.calculate, color: Colors.green),
              title: Text(
                "Ejercicio 1",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              tileColor: Color.fromRGBO(87, 223, 8, 0.2),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pantalla1()),
              ),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.calculate, color: Colors.orange),
              title: Text(
                "Ejercicio 2",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pantalla2()),
              ),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.calculate, color: Colors.purple),
              title: Text(
                "Ejercicio 3",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pantalla3()),
              ),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.home_filled, color: Colors.blueGrey),
              title: Text(
                "Inicio",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejercicios02App()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
