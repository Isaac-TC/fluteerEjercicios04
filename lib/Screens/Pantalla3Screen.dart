import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  final ahorroController = TextEditingController();
  final mesesController = TextEditingController();
  final interesController = TextEditingController();

  String resultado = "";
  List<String> detalle = [];

  void calcularAhorro() {
    double ahorroMensual = double.tryParse(ahorroController.text) ?? -1;
    int meses = int.tryParse(mesesController.text) ?? -1;
    double interesMensual = double.tryParse(interesController.text) ?? 0;

    if (ahorroMensual <= 0 || meses <= 0) {
      _mostrarAlerta("⚠️ Ingresa valores válidos y positivos.");
      return;
    }

    double total = 0;
    detalle.clear();

    for (int i = 1; i <= meses; i++) {
      total = (total + ahorroMensual) * (1 + interesMensual / 100);
      detalle.add("Mes $i: \$${total.toStringAsFixed(2)}");
    }

    setState(() {
      resultado = "💰 Ahorro total acumulado: \$${total.toStringAsFixed(2)}";
    });
  }

  void _mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Error"),
        content: Text(mensaje),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
        ],
      ),
    );
  }

  void limpiarCampos() {
    ahorroController.clear();
    mesesController.clear();
    interesController.clear();
    setState(() {
      resultado = "";
      detalle.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PANTALLA 3 - Simulador de Ahorro")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ahorroController,
              decoration: InputDecoration(
                labelText: "Ahorro mensual (\$)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: mesesController,
              decoration: InputDecoration(
                labelText: "Cantidad de meses",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: interesController,
              decoration: InputDecoration(
                labelText: "Tasa de interés mensual (%) (opcional)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: calcularAhorro, child: Text("Calcular")),
                ElevatedButton(onPressed: limpiarCampos, child: Text("Limpiar")),
              ],
            ),
            SizedBox(height: 20),
            Text(resultado, style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 10),
            ...detalle.map((e) => Text(e)).toList(),
          ],
        ),
      ),
    );
  }
}
