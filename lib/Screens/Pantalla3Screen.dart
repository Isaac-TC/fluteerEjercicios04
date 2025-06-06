import 'package:actividad_audraw/navigation/Drawer.dart';

import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PANTALLA 3"),
      ),
      body: Center(child: Text("SCREEN 3")),
      drawer: MiDrawer(),
    );
  }
}