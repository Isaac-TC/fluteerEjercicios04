
import 'package:actividad_audraw/Screens/Pantalla1Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla2Screen.dart';
import 'package:actividad_audraw/Screens/Pantalla3Screen.dart';
import 'package:actividad_audraw/main.dart';

import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: ListView(
           padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column( 
                children: [
                  Text("Home"),
                 // Expanded(child: Image.asset("assets/images/logo.png",)),
                  TextButton(onPressed: ()=>(), child: Text("sitio web"))

              ],),
            decoration: BoxDecoration(color: Colors.blue),),


            ListTile(
              title: Text("Pantalla1",style: TextStyle(backgroundColor: Color.fromRGBO(87, 223, 8, 1)),),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla1())),
            ),
            ListTile(
              title: Text("Pantalla 2"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla2())),
            ),
            ListTile(
              title: Text("pantalla 3"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla3())),
            ),
            ListTile(

              title: Row(
                children: [
                  Icon(Icons.home_filled), Container(width:  10),
                  Text("Home"),

              ],),
              onTap: () => 
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicios02App())),
            )
          ],
        ),    
    );
  }
}